Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82BA30568B;
	Mon, 17 Aug 2026 06:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786948097; cv=none; b=UBWLq0FP1vrBD4Yd6XsaeulTRPm2bFCEyrgsNgh31mYkcZRAJ4/d9MF6SeYtt8HXk6rEmNWROj0dCHVWyGNkeRvr/4ANyVDAhXfFQVlsINJDi4xUGZdVW7JwbG9MxZwv4M+Mey79jJZQ7Gy57mg2RWYyRXo/02hUn6DwujL3HIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786948097; c=relaxed/simple;
	bh=cidvZ+OM4JnRVKo9YK/z9Mg6BGH4j7i+dmBvkMSDnTc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PgaS5ZyrogXmujQGXxg+W+DvNP5U3Fq0dcf23qomhpCj6n6iMG3Bqz9Z3OKWwFnWV4+3WAX1O4vxWVBbP5q+iQIFZbANCNKy3WsgKBGBvmMyj6HPc4tilOeSiP5Ci/DSB5XIVZGyOsGAgL0D0K18rYP98sp9SeXKlCi5z0ICvj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: d1977b7a9a0411f19a56ed5b684f684d-20260817
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:eccd38e2-6854-4ebc-9813-fb1f93fd1060,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:7db8b62,CLOUDID:8ae3b9007b8de28b99bff9c0448a93ff,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898,TC:nil,Content:0|15|50,EDM:5,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d1977b7a9a0411f19a56ed5b684f684d-20260817
X-User: yanlonglong@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <yanlonglong@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 706105097; Mon, 17 Aug 2026 14:28:11 +0800
From: longlong yan <yanlonglong@kylinos.cn>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	longlong yan <yanlonglong@kylinos.cn>
Subject: [PATCH] usb: f_fs-aio-simple: add NULL checks for malloc calls
Date: Mon, 17 Aug 2026 14:27:56 +0800
Message-ID: <20260817062756.781-1-yanlonglong@kylinos.cn>
X-Mailer: git-send-email 2.47.1.windows.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add NULL checks for the return values of malloc() in the aio_simple
FFS example application. If any of the four malloc calls (buf_in,
buf_out, iocb_in, iocb_out) fails, the subsequent code would
dereference NULL pointers in the main loop.

Since free(NULL) is safe, the error path frees all four buffers
unconditionally, then cleans up the remaining resources (io context,
endpoint file descriptors) consistent with the existing cleanup at
the end of the function.

Signed-off-by: longlong yan <yanlonglong@kylinos.cn>
---
 .../ffs-aio-example/simple/device_app/aio_simple.c  | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tools/usb/ffs-aio-example/simple/device_app/aio_simple.c b/tools/usb/ffs-aio-example/simple/device_app/aio_simple.c
index 96616eb4600b..07ca1f136ad7 100644
--- a/tools/usb/ffs-aio-example/simple/device_app/aio_simple.c
+++ b/tools/usb/ffs-aio-example/simple/device_app/aio_simple.c
@@ -294,6 +294,19 @@ int main(int argc, char *argv[])
 	iocb_in = malloc(sizeof(*iocb_in));
 	iocb_out = malloc(sizeof(*iocb_out));
 
+	if (!buf_in || !buf_out || !iocb_in || !iocb_out) {
+		perror("malloc");
+		free(buf_in);
+		free(buf_out);
+		free(iocb_in);
+		free(iocb_out);
+		io_destroy(ctx);
+		for (i = 0; i < 2; ++i)
+			close(ep[i]);
+		close(ep0);
+		return 1;
+	}
+
 	while (1) {
 		FD_ZERO(&rfds);
 		FD_SET(ep0, &rfds);
-- 
2.43.0

