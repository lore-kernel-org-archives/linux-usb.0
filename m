Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.111.35.243
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793531768;
	b=YmSkFy2fBP5DcEG9SZkQakGjwy8HmY+VqWUmnXrZI+AYiUNqtb7MQslLV651RL6xzvX+
	 rD05ebRi7bM2w0S4tF3cKYiFat2wDK8oLvCwS6mUTrqQEEsiE7J7GiQ5SdULtoUk0v8D/
	 puPirOoS947xC4OVrGbqblr+PsXGIE+f3rqB44efCirMTDNvLIRxgancZCF3QsoyRIRwZ
	 kzgGJ9f+M4Sv2dLIcRCtNlxOWLwm/f/xV/OiPTl5GS8p/qbruXLCNIru5h7iu6Qa5oc3b
	 qMo7s0q91paToztWsAI7V9AVZpIACzLInsqfqqUNPMljEITdKWk6uBOw1xjImzAfC+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793531768;
	h=DMARC-Filter:X-Originating-IP:Received:DKIM-Signature:X-Session-ID:
	 X-Originating-IP:X-Works-Send-Opt:X-Works-Smtp-Source:Received:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8yiQgSkcjrtpLMtTUfz28ERZ3TG7d5f2dZyvpdlxw/0=;
	b=kXE/auVCcvi632KTFhiwfrqtj42+keG0I3/qPPn5O47QCYFDMECjzjBSh1D1ORzPBmbf
	 oQl/qM+HKMapOYys59pqHaAc91JMYP2R+L6PS25FRoe8/OkdaLrIZUQQ9APSaksGRKyfI
	 VWYk2OTaG5fe9GO9wdbSSYkTO8J6q/HsUGQidbw6PJdQbzRlsHo45h3dmHkMA/QG2kmEC
	 fyOP1/OjOh1RdyuIQVFQDnoWw4HNtOp71fOcCY9WNXQFh+zWZwKNerj9JiBQRfLeB9p2M
	 z9/hIhLptFXgV6yjjmnJBzTB8Sxd22FdysJ0xgta0pZPLUXxK6AN92tANipx7gg48qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=naver.com;
	spf=pass smtp.mailfrom=naver.com;
	dkim=pass header.d=naver.com header.i=@naver.com header.a=rsa-sha256 header.s=s20171208 header.b=kc2f3wW2;
	arc=none smtp.remote-ip=114.111.35.243
Received: from cvsmtppost36.nm.naver.com (cvsmtppost36.nm.naver.com [114.111.35.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C188A606A324
	for <linux-usb@vger.kernel.org>; Sun,  1 Nov 2026 11:16:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C188A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=naver.com header.i=@naver.com header.a=rsa-sha256 header.s=s20171208 header.b=kc2f3wW2
Received: from nv1s-hmac-real-21 ([10.180.31.91])
  by cvsmtppost36.nm.naver.com with ESMTP id cY6RVcEkRqSXLnCqrzruYA
  for <linux-usb@vger.kernel.org>;
  Sun, 01 Nov 2026 11:16:00 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1793531760; bh=mlbCGJoU2uJsE8ePKxCM0hFOO3helzQTVbOGGS81G7g=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=kc2f3wW2/EnFhBerHUmbbuXugfcvSdF4vbUilsEhedUCfGbQS+K25QX9X3MuI1a7q
	 ycy4IWKEAhPQIgbBVYNC5mB0P9AsOIjPVQREL8IN7Mb/ONxXUA+HrcZKF9tc9zeGCV
	 dGpSSJl0iRvAQirqvIz2zxmR6rlu5tevA2nB/0fGFmF6DnnVGazS2Z1cgPD0SEopbM
	 kAd9hNQbhBzWunKvv9sIJ0Re6anOROgASzebdHwjmMdHQWj3M8RTG+d12LwlcjMKMH
	 jfnC2ItoHRYaDdK5cfpIcNAzkEQBmmlAoDtCjd8Y4dWiBRz/MnX6cmwbmfnM80iXI5
	 SnU6Dw1qAwY6A==
X-Session-ID: ng3fXfmnS4mh00aO+C6Vfg
X-Works-Send-Opt: OPRwpzGdjHmdKHFOMr39Ko3YKBm9jAudFqM9KqMqFxIYkEljxBmwjAg=
X-Works-Smtp-Source: I9nlFAKlFqJZ+HmlFxKl+6E=
Received: from localhost.localdomain ([115.136.205.4])
  by cvnsmtp005.nm.naver.com with ESMTP id ng3fXfmnS4mh00aO+C6Vfg
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Sun, 01 Nov 2026 11:15:59 -0000
From: Sung Byeongchan <tjdqudcks0424@naver.com>
To: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Hongren Zheng <i@zenithal.me>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	Sung Byeongchan <tjdqudcks0424@naver.com>
Subject: [PATCH v2] usbip: clear actual length after receive failure
Date: Sun,  1 Nov 2026 20:15:51 +0900
Message-ID: <20261101111551.1785593-1-tjdqudcks0424@naver.com>
X-Mailer: git-send-email 2.43.0
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

A USB/IP peer supplies actual_length in RET_SUBMIT. usbip_recv_xbuff()
rejects positive values larger than the URB transfer buffer, but stores the
u32 length in a signed int. Values with the top bit set therefore take the
size <= 0 success path and the VHCI gives the URB back with the
peer-controlled length still present.

usbfs completion consumers use urb->actual_length as an unsigned extent. On
review base e971f4f365bad, 0x80000000, 0x80000001, and 0xffffffff each
produced a KASAN out-of-bounds read with usbfs snooping enabled in three
fresh boots, both before the original patch and with its V1 applied.

Keep the transfer extent unsigned in usbip_recv_xbuff(), so the existing
transfer-buffer bound rejects positive and top-bit-set oversized values.
Also clear actual_length when receiving the transfer buffer fails. No
payload is valid on this error path, and zero prevents completion consumers
from reusing the rejected extent.

The V2 kernel completed 42 fresh-boot cases across normal, short,
positive oversized, high-bit, and both snoop modes without KASAN.
Rejected completions were normalized to -EPROTO and actual_length zero;
following valid URBs, reconnect/recovery, and disconnect cleanup remained
functional.

The demonstrated impact is a kernel out-of-bounds read and possible crash
from an untrusted USB/IP peer. Information disclosure, a controlled write,
RCE, and LPE were not demonstrated.

This issue was found through manual source inspection assisted by an
AI/LLM, then evaluated with local production-path dynamic validation.

Fixes: aabb5b833872 ("usbip: Fix error path of vhci_recv_ret_submit()")
Signed-off-by: Sung Byeongchan <tjdqudcks0424@naver.com>
---
 drivers/usb/usbip/usbip_common.c | 2 +-
 drivers/usb/usbip/vhci_rx.c      | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/usbip/usbip_common.c b/drivers/usb/usbip/usbip_common.c
index 100f8920624bb..e3cfe7ccd0455 100644
--- a/drivers/usb/usbip/usbip_common.c
+++ b/drivers/usb/usbip/usbip_common.c
@@ -831,7 +831,7 @@ int usbip_recv_xbuff(struct usbip_device *ud, struct urb *urb)
 	struct scatterlist *sg;
 	int ret = 0;
 	int recv;
-	int size;
+	unsigned int size;
 	int copy;
 	int i;
 
diff --git a/drivers/usb/usbip/vhci_rx.c b/drivers/usb/usbip/vhci_rx.c
index a678e7c898375..741107a964660 100644
--- a/drivers/usb/usbip/vhci_rx.c
+++ b/drivers/usb/usbip/vhci_rx.c
@@ -79,6 +79,7 @@ static void vhci_recv_ret_submit(struct vhci_device *vdev,
 	/* recv transfer buffer */
 	if (usbip_recv_xbuff(ud, urb) < 0) {
 		urb->status = -EPROTO;
+		urb->actual_length = 0;
 		goto error;
 	}
 
-- 
2.43.0

