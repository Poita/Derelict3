/*

Boost Software License - Version 1.0 - August 17th, 2003

Permission is hereby granted, free of charge, to any person or organization
obtaining a copy of the software and accompanying documentation covered by
this license (the "Software") to use, reproduce, display, distribute,
execute, and transmit the Software, and to prepare derivative works of the
Software, and to permit third-parties to whom the Software is furnished to
do so, all subject to the following:

The copyright notices in the Software and this entire statement, including
the above license grant, this restriction and the following disclaimer,
must be included in all copies of the Software, in whole or in part, and
all derivative works of the Software, unless such copies or derivative
works are solely in the form of machine-executable object code generated by
a source language processor.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.

*/
module derelict.sfml2.network;

public
{
    import derelict.sfml2.networktypes;
    import derelict.sfml2.networkfunctions;
}

private
{
    import derelict.util.loader;
    import derelict.util.system;

    static if(Derelict_OS_Windows)
        enum libNames = "csfml-network-2.dll";
    else static if(Derelict_OS_Mac)
        enum libNames = "libcsfml-network.2.dylib";
    else static if(Derelict_OS_Posix)
        enum libNames = "libcsfml-network.so.2";
    else
        static assert(0, "Need to implement SFML2 Network libNames for this operating system.");
}

class DerelictSFML2NetworkLoader : SharedLibLoader
{
    protected
    {
        override void loadSymbols()
        {
            bindFunc(cast(void**)&sfFtpListingResponse_destroy, "sfFtpListingResponse_destroy");
            bindFunc(cast(void**)&sfFtpListingResponse_isOk, "sfFtpListingResponse_isOk");
            bindFunc(cast(void**)&sfFtpListingResponse_getStatus, "sfFtpListingResponse_getStatus");
            bindFunc(cast(void**)&sfFtpListingResponse_getMessage, "sfFtpListingResponse_getMessage");
            bindFunc(cast(void**)&sfFtpListingResponse_getCount, "sfFtpListingResponse_getCount");
            bindFunc(cast(void**)&sfFtpListingResponse_getFilename, "sfFtpListingResponse_getFilename");
            bindFunc(cast(void**)&sfFtpDirectoryResponse_destroy, "sfFtpDirectoryResponse_destroy");
            bindFunc(cast(void**)&sfFtpDirectoryResponse_isOk, "sfFtpDirectoryResponse_isOk");
            bindFunc(cast(void**)&sfFtpDirectoryResponse_getStatus, "sfFtpDirectoryResponse_getStatus");
            bindFunc(cast(void**)&sfFtpDirectoryResponse_getMessage, "sfFtpDirectoryResponse_getMessage");
            bindFunc(cast(void**)&sfFtpDirectoryResponse_getDirectory, "sfFtpDirectoryResponse_getDirectory");
            bindFunc(cast(void**)&sfFtpResponse_destroy, "sfFtpResponse_destroy");
            bindFunc(cast(void**)&sfFtpResponse_isOk, "sfFtpResponse_isOk");
            bindFunc(cast(void**)&sfFtpResponse_getStatus, "sfFtpResponse_getStatus");
            bindFunc(cast(void**)&sfFtpResponse_getMessage, "sfFtpResponse_getMessage");
            bindFunc(cast(void**)&sfFtp_create, "sfFtp_create");
            bindFunc(cast(void**)&sfFtp_destroy, "sfFtp_destroy");
            bindFunc(cast(void**)&sfFtp_connect, "sfFtp_connect");
            bindFunc(cast(void**)&sfFtp_loginAnonymous, "sfFtp_loginAnonymous");
            bindFunc(cast(void**)&sfFtp_login, "sfFtp_login");
            bindFunc(cast(void**)&sfFtp_disconnect, "sfFtp_disconnect");
            bindFunc(cast(void**)&sfFtp_keepAlive, "sfFtp_keepAlive");
            bindFunc(cast(void**)&sfFtp_getWorkingDirectory, "sfFtp_getWorkingDirectory");
            bindFunc(cast(void**)&sfFtp_getDirectoryListing, "sfFtp_getDirectoryListing");
            bindFunc(cast(void**)&sfFtp_changeDirectory, "sfFtp_changeDirectory");
            bindFunc(cast(void**)&sfFtp_parentDirectory, "sfFtp_parentDirectory");
            bindFunc(cast(void**)&sfFtp_createDirectory, "sfFtp_createDirectory");
            bindFunc(cast(void**)&sfFtp_deleteDirectory, "sfFtp_deleteDirectory");
            bindFunc(cast(void**)&sfFtp_renameFile, "sfFtp_renameFile");
            bindFunc(cast(void**)&sfFtp_deleteFile, "sfFtp_deleteFile");
            bindFunc(cast(void**)&sfFtp_download, "sfFtp_download");
            bindFunc(cast(void**)&sfFtp_upload, "sfFtp_upload");
            bindFunc(cast(void**)&sfHttpRequest_create, "sfHttpRequest_create");
            bindFunc(cast(void**)&sfHttpRequest_destroy, "sfHttpRequest_destroy");
            bindFunc(cast(void**)&sfHttpRequest_setField, "sfHttpRequest_setField");
            bindFunc(cast(void**)&sfHttpRequest_setMethod, "sfHttpRequest_setMethod");
            bindFunc(cast(void**)&sfHttpRequest_setUri, "sfHttpRequest_setUri");
            bindFunc(cast(void**)&sfHttpRequest_setHttpVersion, "sfHttpRequest_setHttpVersion");
            bindFunc(cast(void**)&sfHttpRequest_setBody, "sfHttpRequest_setBody");
            bindFunc(cast(void**)&sfHttpResponse_destroy, "sfHttpResponse_destroy");
            bindFunc(cast(void**)&sfHttpResponse_getField, "sfHttpResponse_getField");
            bindFunc(cast(void**)&sfHttpResponse_getStatus, "sfHttpResponse_getStatus");
            bindFunc(cast(void**)&sfHttpResponse_getMajorVersion, "sfHttpResponse_getMajorVersion");
            bindFunc(cast(void**)&sfHttpResponse_getMinorVersion, "sfHttpResponse_getMinorVersion");
            bindFunc(cast(void**)&sfHttpResponse_getBody, "sfHttpResponse_getBody");
            bindFunc(cast(void**)&sfHttp_create, "sfHttp_create");
            bindFunc(cast(void**)&sfHttp_destroy, "sfHttp_destroy");
            bindFunc(cast(void**)&sfHttp_setHost, "sfHttp_setHost");
            bindFunc(cast(void**)&sfHttp_sendRequest, "sfHttp_sendRequest");
            bindFunc(cast(void**)&sfIpAddress_fromString, "sfIpAddress_fromString");
            bindFunc(cast(void**)&sfIpAddress_fromBytes, "sfIpAddress_fromBytes");
            bindFunc(cast(void**)&sfIpAddress_fromInteger, "sfIpAddress_fromInteger");
            bindFunc(cast(void**)&sfIpAddress_toString, "sfIpAddress_toString");
            bindFunc(cast(void**)&sfIpAddress_toInteger, "sfIpAddress_toInteger");
            bindFunc(cast(void**)&sfIpAddress_getLocalAddress, "sfIpAddress_getLocalAddress");
            bindFunc(cast(void**)&sfIpAddress_getPublicAddress, "sfIpAddress_getPublicAddress");
            bindFunc(cast(void**)&sfPacket_create, "sfPacket_create");
            bindFunc(cast(void**)&sfPacket_copy, "sfPacket_copy");
            bindFunc(cast(void**)&sfPacket_destroy, "sfPacket_destroy");
            bindFunc(cast(void**)&sfPacket_append, "sfPacket_append");
            bindFunc(cast(void**)&sfPacket_clear, "sfPacket_clear");
            bindFunc(cast(void**)&sfPacket_getData, "sfPacket_getData");
            bindFunc(cast(void**)&sfPacket_getDataSize, "sfPacket_getDataSize");
            bindFunc(cast(void**)&sfPacket_endOfPacket, "sfPacket_endOfPacket");
            bindFunc(cast(void**)&sfPacket_canRead, "sfPacket_canRead");
            bindFunc(cast(void**)&sfPacket_readBool, "sfPacket_readBool");
            bindFunc(cast(void**)&sfPacket_readInt8, "sfPacket_readInt8");
            bindFunc(cast(void**)&sfPacket_readUint8, "sfPacket_readUint8");
            bindFunc(cast(void**)&sfPacket_readInt16, "sfPacket_readInt16");
            bindFunc(cast(void**)&sfPacket_readUint16, "sfPacket_readUint16");
            bindFunc(cast(void**)&sfPacket_readInt32, "sfPacket_readInt32");
            bindFunc(cast(void**)&sfPacket_readUint32, "sfPacket_readUint32");
            bindFunc(cast(void**)&sfPacket_readFloat, "sfPacket_readFloat");
            bindFunc(cast(void**)&sfPacket_readDouble, "sfPacket_readDouble");
            bindFunc(cast(void**)&sfPacket_readString, "sfPacket_readString");
            bindFunc(cast(void**)&sfPacket_readWideString, "sfPacket_readWideString");
            bindFunc(cast(void**)&sfPacket_writeBool, "sfPacket_writeBool");
            bindFunc(cast(void**)&sfPacket_writeInt8, "sfPacket_writeInt8");
            bindFunc(cast(void**)&sfPacket_writeUint8, "sfPacket_writeUint8");
            bindFunc(cast(void**)&sfPacket_writeInt16, "sfPacket_writeInt16");
            bindFunc(cast(void**)&sfPacket_writeUint16, "sfPacket_writeUint16");
            bindFunc(cast(void**)&sfPacket_writeInt32, "sfPacket_writeInt32");
            bindFunc(cast(void**)&sfPacket_writeUint32, "sfPacket_writeUint32");
            bindFunc(cast(void**)&sfPacket_writeFloat, "sfPacket_writeFloat");
            bindFunc(cast(void**)&sfPacket_writeDouble, "sfPacket_writeDouble");
            bindFunc(cast(void**)&sfPacket_writeString, "sfPacket_writeString");
            bindFunc(cast(void**)&sfPacket_writeWideString, "sfPacket_writeWideString");
            bindFunc(cast(void**)&sfSocketSelector_create, "sfSocketSelector_create");
            bindFunc(cast(void**)&sfSocketSelector_copy, "sfSocketSelector_copy");
            bindFunc(cast(void**)&sfSocketSelector_destroy, "sfSocketSelector_destroy");
            bindFunc(cast(void**)&sfSocketSelector_addTcpListener, "sfSocketSelector_addTcpListener");
            bindFunc(cast(void**)&sfSocketSelector_addTcpSocket, "sfSocketSelector_addTcpSocket");
            bindFunc(cast(void**)&sfSocketSelector_addUdpSocket, "sfSocketSelector_addUdpSocket");
            bindFunc(cast(void**)&sfSocketSelector_removeTcpListener, "sfSocketSelector_removeTcpListener");
            bindFunc(cast(void**)&sfSocketSelector_removeTcpSocket, "sfSocketSelector_removeTcpSocket");
            bindFunc(cast(void**)&sfSocketSelector_removeUdpSocket, "sfSocketSelector_removeUdpSocket");
            bindFunc(cast(void**)&sfSocketSelector_clear, "sfSocketSelector_clear");
            bindFunc(cast(void**)&sfSocketSelector_wait, "sfSocketSelector_wait");
            bindFunc(cast(void**)&sfSocketSelector_isTcpListenerReady, "sfSocketSelector_isTcpListenerReady");
            bindFunc(cast(void**)&sfSocketSelector_isTcpSocketReady, "sfSocketSelector_isTcpSocketReady");
            bindFunc(cast(void**)&sfSocketSelector_isUdpSocketReady, "sfSocketSelector_isUdpSocketReady");
            bindFunc(cast(void**)&sfTcpListener_create, "sfTcpListener_create");
            bindFunc(cast(void**)&sfTcpListener_destroy, "sfTcpListener_destroy");
            bindFunc(cast(void**)&sfTcpListener_setBlocking, "sfTcpListener_setBlocking");
            bindFunc(cast(void**)&sfTcpListener_isBlocking, "sfTcpListener_isBlocking");
            bindFunc(cast(void**)&sfTcpListener_getLocalPort, "sfTcpListener_getLocalPort");
            bindFunc(cast(void**)&sfTcpListener_listen, "sfTcpListener_listen");
            bindFunc(cast(void**)&sfTcpListener_accept, "sfTcpListener_accept");
            bindFunc(cast(void**)&sfTcpSocket_create, "sfTcpSocket_create");
            bindFunc(cast(void**)&sfTcpSocket_destroy, "sfTcpSocket_destroy");
            bindFunc(cast(void**)&sfTcpSocket_setBlocking, "sfTcpSocket_setBlocking");
            bindFunc(cast(void**)&sfTcpSocket_isBlocking, "sfTcpSocket_isBlocking");
            bindFunc(cast(void**)&sfTcpSocket_getLocalPort, "sfTcpSocket_getLocalPort");
            bindFunc(cast(void**)&sfTcpSocket_getRemoteAddress, "sfTcpSocket_getRemoteAddress");
            bindFunc(cast(void**)&sfTcpSocket_getRemotePort, "sfTcpSocket_getRemotePort");
            bindFunc(cast(void**)&sfTcpSocket_connect, "sfTcpSocket_connect");
            bindFunc(cast(void**)&sfTcpSocket_disconnect, "sfTcpSocket_disconnect");
            bindFunc(cast(void**)&sfTcpSocket_send, "sfTcpSocket_send");
            bindFunc(cast(void**)&sfTcpSocket_receive, "sfTcpSocket_receive");
            bindFunc(cast(void**)&sfTcpSocket_sendPacket, "sfTcpSocket_sendPacket");
            bindFunc(cast(void**)&sfTcpSocket_receivePacket, "sfTcpSocket_receivePacket");
            bindFunc(cast(void**)&sfUdpSocket_create, "sfUdpSocket_create");
            bindFunc(cast(void**)&sfUdpSocket_destroy, "sfUdpSocket_destroy");
            bindFunc(cast(void**)&sfUdpSocket_setBlocking, "sfUdpSocket_setBlocking");
            bindFunc(cast(void**)&sfUdpSocket_isBlocking, "sfUdpSocket_isBlocking");
            bindFunc(cast(void**)&sfUdpSocket_getLocalPort, "sfUdpSocket_getLocalPort");
            bindFunc(cast(void**)&sfUdpSocket_bind, "sfUdpSocket_bind");
            bindFunc(cast(void**)&sfUdpSocket_Unbind, "sfUdpSocket_Unbind");
            bindFunc(cast(void**)&sfUdpSocket_send, "sfUdpSocket_send");
            bindFunc(cast(void**)&sfUdpSocket_receive, "sfUdpSocket_receive");
            bindFunc(cast(void**)&sfUdpSocket_sendPacket, "sfUdpSocket_sendPacket");
            bindFunc(cast(void**)&sfUdpSocket_receivePacket, "sfUdpSocket_receivePacket");
            bindFunc(cast(void**)&sfUdpSocket_maxDatagramSize, "sfUdpSocket_maxDatagramSize");
        }
    }

    public
    {
        this()
        {
            super(libNames);
        }
    }
}

__gshared DerelictSFML2NetworkLoader DerelictSFML2Network;

shared static this()
{
    DerelictSFML2Network = new DerelictSFML2NetworkLoader();
}

shared static ~this()
{
    if(SharedLibLoader.isAutoUnloadEnabled())
        DerelictSFML2Network.unload();
}