Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792619300;
	b=riMeCniSZ0c0g9CuPI3EJfJ8MeCYjVLjqXxezjw1YX6esXKS3X0iNjE3zskQTzN7Otlc
	 qcBMBxN5GDK310j5YQTvsgghQOr1oT5sHXcYjkQ9sBM7/0ByI7yvdJGUlWe0kyXZmeS0J
	 TcnzPk5xn5V98hzn1VQBs8Gt5BKYiH4xFSlTgd5HOu4xG191cFPH8krxR7DqHag93FWoW
	 U3t6uzo2pBxsQ1XZTVJiFwG8iUCS8Btxt+hjsyWGeBPEhNxIMiIMxlO7HxFBv5cV1RuTO
	 G/8FaHiWA6U7qJpqazae4fGns1vnqZIwGcOSSzz1XfiInOLjqn+Uf/qDYPkiG96BYkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792619300;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UH0bOM4H1xg0UDvNRyPCMjiNs8zOKGQ2ix93OeISz/A=;
	b=IUTommLYFyXbc/435kHZ33ShT3BkYltHpEYzRAAhOGMOp/EWbHDO75Kmu2lphgqpYWNV
	 voDoWXh5KeUiYuEstj6OD9R39wDIscDFviqTP34dgu6sNmwJAVOXr8Qqcur+Gq53dxbVR
	 vanYvMyRABJiE66WQeHLETdKPjdPpz48ziYLB7/tJ9EGArZzr6vefoS1G22vCK+DoVvVc
	 wi4NgedNygeSAUNWo2fRa/vLk7INbn+jrypeIts0ncqNPKWdY2SjlhyNwRZ9WrF32LMuQ
	 CphbYFOwUYJBGnNm6pi8pDzMZqSIDybpjPflxoTGoDyDNCAgSTvTEQAc1y30leqdMTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Jt1cV7H2;
	arc=none smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDB9606A31E
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 21:48:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CDB9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Jt1cV7H2
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-48e9476e26aso505959fac.3
        for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 14:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792619299; x=1793224099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UH0bOM4H1xg0UDvNRyPCMjiNs8zOKGQ2ix93OeISz/A=;
        b=Jt1cV7H2PJnnP7pxhFRqgXXxETceEzSYPj8b2D9hC9fiZcuWawY/y6kl5uj5SSIhHc
         HoX074f2ugMn5PnPmtudkAjL9xY/E1H0d4hIYcS9T05IRQ8hTUk721sEf0roUEtdOQWG
         YKHFmyDMqM7On+qijz9ojo6KWrgJ3lC/DMY0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792619299; x=1793224099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UH0bOM4H1xg0UDvNRyPCMjiNs8zOKGQ2ix93OeISz/A=;
        b=noB6EHGLleDN/EOV/BST1+ICm7721Ezs7oqPQPNnyKLx8YI7SfCusFk0On8A56M14Z
         oACWJN+ouUcAHEB25XsEAZy1PcI/kYEJe/adb99xA/SkmE3mat/Ez4n1g8Nd6paazoS3
         ZKNMUtPX+miH/aMNIKKXuwz3yaqj73fA606kMVRunzbvH/G1qpc8yF0pSq4VjJkQ94DD
         07AvBbYV/Pn7gy47+3uaA8EG0W2doFIdsrN4iKddVMQG/U8eN3maC0viMq9+tQja4LeC
         QwpiKFcqUPAzbBQ/Y9FYLFdixmgxFimvwp7XBFuKVYomNW8Ns2H9LHi1ecQBfvVrJmh3
         etlQ==
X-Forwarded-Encrypted: i=1; AKwUvBzc+V+BfdfGcPtBlWGa7M0jWZS8szeXbWWRd2t+Qsx0dv02kYdVrqas83lyjNnhiApy+rMhgynwWB4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYG8qvqLb7oRzchdExmre+gwPLyyYNfLZW3WISVo35X0DyKQak
	pRn7PpoUV/8K379bmRc9+30ukI0uxwq57kFGsXBNLIPFNN2ajzWkLpvQjVojBMz07Q==
X-Gm-Gg: AYBFou2nOuRHyLeqDcgf5GgiALer0kwXSifWdwNQAOdsT+WKV3RVeN/4XybEeyTS0px
	gq7S48yuo7os0uiMb9/MtgAmykNyMOoX8PXyyDn18mq79HqrMn5+irTnqYYi33UOMSM4Vaq7jsP
	76JN+48l+iaIe3XSyRsBhcnKcGxRWJWjEZFy26yEvsJx5EnMapZa0bLjn0UXb+yLSPafzCkJ/3E
	G/r1BRGNigPSpgW8IcIov+rB6kJFw57FOhktgDDrkFUxs5kSP75yT6Lzqu1zW3Ck0Tt82PhT48A
	olyPkCybLx1oitBt3gx3jr0317XHavTm0f1K7+VrTB22dXmUgOSyJWfwQ1793+X1wcdhWQmAbkZ
	BmGHIMmpWMdK5ZMxLTEGv9PVrdP00dmss0GjDH0uaKrwZydvbm1VPvBIdFy/le2A6cPVn7uIfp5
	ZMD+fyQtjmaexZF8jyrDaa8XHQm3oLxGuuTXRcioTPRqqXryDo39XNFt7XGl1fxIGzl4IKuUv9V
	/D4s3oDBDYEbgiEN0fVruOA/yMXsPfQBe3uJ227WHwFWSqC2efaxWEMX2ZNW823hTb7G4XFhsYu
	pXd3pZNXcenL/wLo3o6cNoNdbVHCfCmZ87ze/OFv1nUA
X-Received: by 2002:a05:6870:3355:b0:4a7:8b70:3337 with SMTP id 586e51a60fabf-4a7dc44f3c1mr2673024fac.60.1792619299204;
        Wed, 21 Oct 2026 14:48:19 -0700 (PDT)
Received: from rrangel.c.googlers.com.com (202.168.136.34.bc.googleusercontent.com. [34.136.168.202])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a7d61ce790sm2967755fac.11.2026.10.21.14.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:48:18 -0700 (PDT)
From: Raul E Rangel <rrangel@chromium.org>
To: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Hongren Zheng <i@zenithal.me>,
	Raul E Rangel <rrangel@chromium.org>
Subject: [PATCH] usbip: tools: add --sockfd option to usbip attach
Date: Wed, 21 Oct 2026 15:48:08 -0600
Message-ID: <20261021214808.58609-1-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'usbip attach' always opens its own TCP connection to --remote. A client
that reaches the USB/IP server some other way, for example over a UNIX
domain socket or a channel forwarded by a multiplexed SSH connection,
therefore has to expose a listening TCP port on the local host just so
usbip can connect back to it. Any local user can connect to that port
while it is open.

Add a '--sockfd <fd>' option (short option '-s') that attaches the
device over an inherited, already-connected stream socket instead.
'--sockfd' and '--remote' are mutually exclusive. Because sudo closes
file descriptors >= 3 by default but preserves stdin, the typical
invocation passes the socket as stdin:

  sudo usbip attach --sockfd 0 --busid <busid>

The descriptor must be a connected SOCK_STREAM socket: fstat() must
report S_ISSOCK, getsockopt(SO_TYPE) must return SOCK_STREAM and
getpeername() must succeed. Both AF_UNIX and AF_INET/AF_INET6 sockets
are accepted, since vhci_hcd only requires a SOCK_STREAM socket. For
AF_INET/AF_INET6 sockets, TCP_NODELAY and SO_KEEPALIVE are set as
usbip_net_tcp_connect() does.

The connection recorded in /var/run/vhci_hcd/port<N> for 'usbip port'
uses the numeric peer address and port for AF_INET/AF_INET6 sockets.
UNIX sockets have no port, so 'unix' and '-' are recorded instead; this
keeps read_record() working and 'usbip port' shows
'usbip://unix:-/<busid>'.

Update doc/usbip.8 and the usage text accordingly.

Signed-off-by: Raul E Rangel <rrangel@chromium.org>
Assisted-by: Gemini
---
Tested on x86_64 with vhci_hcd, against a userspace USB/IP server:
- AF_UNIX: stdin connected to the server over a UNIX socket. The device
  enumerated, 'usbip port' showed usbip://unix:-/<busid>, and closing
  the server's socket detached the device.
- AF_INET: stdin connected over TCP to 127.0.0.1. The device enumerated,
  'usbip port' showed usbip://127.0.0.1:<port>/<busid>, and closing the
  connection detached the device.
- Error paths: non-socket fd, SOCK_DGRAM socket, unconnected socket,
  invalid fd number, --sockfd together with --remote, and neither.
- 'usbip attach --remote' behaves as before.

 tools/usb/usbip/doc/usbip.8        |  20 +++++
 tools/usb/usbip/src/usbip_attach.c | 118 ++++++++++++++++++++++++++++-
 2 files changed, 134 insertions(+), 4 deletions(-)

diff --git a/tools/usb/usbip/doc/usbip.8 b/tools/usb/usbip/doc/usbip.8
index 1f26e4a00638..7440eac3e16c 100644
--- a/tools/usb/usbip/doc/usbip.8
+++ b/tools/usb/usbip/doc/usbip.8
@@ -56,6 +56,21 @@ Attach a remote USB gadget.
 Only used when the remote usbipd is in device mode.
 .PP
 
+.HP
+\fBattach\fR \-\-sockfd=<\fIsockfd\fR> \-\-busid=<\fIbus_id\fR>
+.IP
+Attach a remote USB device using an already-connected stream socket
+inherited on file descriptor <sockfd>.
+.PP
+
+.HP
+\fBattach\fR \-\-sockfd=<\fIsockfd\fR> \-\-device=<\fIdev_id\fR>
+.IP
+Attach a remote USB gadget using an already-connected stream socket
+inherited on file descriptor <sockfd>.
+Only used when the remote usbipd is in device mode.
+.PP
+
 .HP
 \fBdetach\fR \-\-port=<\fIport\fR>
 .IP
@@ -117,6 +132,11 @@ List imported devices/gadgets.
     client:# usbip detach --port=0
         - Detach the usb device.
 
+The following example shows attaching over an inherited socket:
+
+    client:# sudo usbip attach --sockfd 0 --busid 1-2
+        - Connect a remote USB device using an inherited socket on file descriptor 0.
+
 The following example shows the usage of device mode
 
     server:# usbip list --device
diff --git a/tools/usb/usbip/src/usbip_attach.c b/tools/usb/usbip/src/usbip_attach.c
index 531a415538f9..00c49038d427 100644
--- a/tools/usb/usbip/src/usbip_attach.c
+++ b/tools/usb/usbip/src/usbip_attach.c
@@ -7,11 +7,14 @@
  *               Krzysztof Opasiak <k.opasiak@samsung.com>
  */
 
+#include <sys/socket.h>
 #include <sys/stat.h>
 
 #include <limits.h>
+#include <netdb.h>
 #include <stdint.h>
 #include <stdio.h>
+#include <stdlib.h>
 #include <string.h>
 
 #include <fcntl.h>
@@ -27,6 +30,7 @@
 static const char usbip_attach_usage_string[] =
 	"usbip attach <args>\n"
 	"    -r, --remote=<host>      The machine with exported USB devices\n"
+	"    -s, --sockfd=<fd>        Connect to inherited socket on <fd>\n"
 	"    -b, --busid=<busid>    Busid of the device on <host>\n"
 	"    -d, --device=<devid>    Id of the virtual UDC on <host>\n";
 
@@ -36,7 +40,8 @@ void usbip_attach_usage(void)
 }
 
 #define MAX_BUFF 100
-static int record_connection(char *host, char *port, char *busid, int rhport)
+static int record_connection(const char *host, const char *port,
+			     const char *busid, int rhport)
 {
 	int fd;
 	char path[PATH_MAX+1];
@@ -198,21 +203,117 @@ static int attach_device(char *host, char *busid)
 	return 0;
 }
 
+static int parse_sockfd(const char *str)
+{
+	char *endptr;
+	long val;
+
+	errno = 0;
+	val = strtol(str, &endptr, 10);
+	if (errno != 0 || endptr == str || *endptr != '\0' ||
+	    val < 0 || val > INT_MAX) {
+		err("invalid sockfd: %s", str);
+		return -1;
+	}
+
+	return (int)val;
+}
+
+static int attach_device_sockfd(const char *sockfd_str, char *busid)
+{
+	struct sockaddr_storage ss;
+	socklen_t len = sizeof(ss);
+	struct stat st;
+	int type = 0;
+	socklen_t optlen = sizeof(type);
+	char host[NI_MAXHOST];
+	char port[NI_MAXSERV];
+	int sockfd;
+	int rc;
+	int rhport;
+
+	sockfd = parse_sockfd(sockfd_str);
+	if (sockfd < 0)
+		return -1;
+
+	if (fstat(sockfd, &st) < 0) {
+		err("fstat failed on sockfd %d: %s", sockfd, strerror(errno));
+		return -1;
+	}
+
+	if (!S_ISSOCK(st.st_mode)) {
+		err("sockfd %d is not a socket", sockfd);
+		return -1;
+	}
+
+	if (getsockopt(sockfd, SOL_SOCKET, SO_TYPE, &type, &optlen) < 0) {
+		err("getsockopt(SO_TYPE) failed on sockfd %d: %s",
+		    sockfd, strerror(errno));
+		return -1;
+	}
+
+	if (type != SOCK_STREAM) {
+		err("sockfd %d is not a SOCK_STREAM socket", sockfd);
+		return -1;
+	}
+
+	if (getpeername(sockfd, (struct sockaddr *)&ss, &len) < 0) {
+		err("getpeername failed on sockfd %d: %s",
+		    sockfd, strerror(errno));
+		return -1;
+	}
+
+	if (ss.ss_family == AF_INET || ss.ss_family == AF_INET6) {
+		usbip_net_set_nodelay(sockfd);
+		usbip_net_set_keepalive(sockfd);
+
+		rc = getnameinfo((struct sockaddr *)&ss, len,
+				 host, sizeof(host), port, sizeof(port),
+				 NI_NUMERICHOST | NI_NUMERICSERV);
+		if (rc) {
+			err("getnameinfo: %s", gai_strerror(rc));
+			return -1;
+		}
+	} else if (ss.ss_family == AF_UNIX) {
+		snprintf(host, sizeof(host), "unix");
+		snprintf(port, sizeof(port), "-");
+	} else {
+		snprintf(host, sizeof(host), "unknown");
+		snprintf(port, sizeof(port), "-");
+	}
+
+	rhport = query_import_device(sockfd, busid);
+	if (rhport < 0)
+		return -1;
+
+	close(sockfd);
+
+	rc = record_connection(host, port, busid, rhport);
+	if (rc < 0) {
+		err("record connection");
+		return -1;
+	}
+
+	return 0;
+}
+
 int usbip_attach(int argc, char *argv[])
 {
 	static const struct option opts[] = {
 		{ "remote", required_argument, NULL, 'r' },
 		{ "busid",  required_argument, NULL, 'b' },
 		{ "device",  required_argument, NULL, 'd' },
+		{ "sockfd", required_argument, NULL, 's' },
 		{ NULL, 0,  NULL, 0 }
 	};
 	char *host = NULL;
 	char *busid = NULL;
+	char *sockfd_str = NULL;
 	int opt;
 	int ret = -1;
 
 	for (;;) {
-		opt = getopt_long(argc, argv, "d:r:b:", opts, NULL);
+		opt = getopt_long(argc, argv, "d:r:b:s:", opts, NULL);
 
 		if (opt == -1)
 			break;
@@ -225,15 +326,24 @@ int usbip_attach(int argc, char *argv[])
 		case 'b':
 			busid = optarg;
 			break;
+		case 's':
+			sockfd_str = optarg;
+			break;
 		default:
 			goto err_out;
 		}
 	}
 
-	if (!host || !busid)
+	if (!busid)
+		goto err_out;
+
+	if ((host && sockfd_str) || (!host && !sockfd_str))
 		goto err_out;
 
-	ret = attach_device(host, busid);
+	if (host)
+		ret = attach_device(host, busid);
+	else
+		ret = attach_device_sockfd(sockfd_str, busid);
 	goto out;
 
 err_out:
-- 
2.56.0.218.g1ec904b173-goog

