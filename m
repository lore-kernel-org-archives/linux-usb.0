Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0014B2046
	for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2026 15:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819876; cv=none; b=SotlX9YXGWmSPLi/D7NrSRDPxCNdoPYki4Jw+6jxM+skswQY7XFc7fZJDBQVlO04FKSgI1PUUXLnR2BTpg4Dxgpl+Hm4rqHlejNalJ9zYCN9muwAHbBkGMycwWD8nj3iRJssIMU8mIfSxbICU7iKyNDb70/K0M+KwwFs+WLoqwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819876; c=relaxed/simple;
	bh=vMCqB0hD0d33CKDMPrXXNYCt+AWzsNFqf9zV1oFDLmU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BgXNPo8Rd9Sz6Y3Nt32y5x51vV1EyPkQoL8OtrBCodjTQKF+/C0lA4FCCh4DwQ74G4Piclq1SttPf/hiSQcrvjRdmAzVWBV28I6OUxsAdukCBVC+1pzAL06ePpuD1tREHUbgjWWRAXp636CItlWmdXcu8wsQgE0WfRIV2Uxv/ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=W8aoxX8g; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="W8aoxX8g"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc751eddf25so1159697a12.3
        for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2026 08:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791819873; x=1792424673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wKZ8udCmDcJ4nEacljHli9T2DKZNy0YCKclfYROWFCw=;
        b=W8aoxX8g9fRHdJ4a/WMixaF7GLZkEVMsM6veY5wo7vQl/3Psw6Hdi4mDMkrdOfpDh7
         NBkHEvmVLRw052jr58vpvVynbhMmIinuSvY6jlgrLGwRnTBXC+lABIFKW7bj7Lc02ydI
         o1IU/d/RPx/6OwJRwgoScp3tflxeQfCKDwbLeZQTz3bQZCThKh6WWaoskBiGBOxizmIc
         zNX1cGp/ZCWLNxP4GsAqtvYvktaOpiHAQYbxEl1wbK+upDf8Jp26SFxi6CuhSDb3QBLS
         irbaTprMrY0h2hcJZjFNucpEETI3BunME5rbfusJk4YJMJ6M1TCVmzz7HNmQbO5VSqBb
         Fhbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791819873; x=1792424673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wKZ8udCmDcJ4nEacljHli9T2DKZNy0YCKclfYROWFCw=;
        b=1Y/NWKEFTSeTsRPMqdZ5My5eR24Wq6S0rnTICgPTeTlUlwl0Ihpw2pz9JSrPjHEigF
         IoJ9h2KVTUO7JyYvUetrzcoc/w0rmvaF3B1n/+l1lcDiWxIbEysN5nrjHmNd0s8uNDji
         S43fMRIpVjoFuNqNugpc31DavcDgTP3Xm4y4+v8lqo2xEJ9t62PmIlW5U3HXt1ITNWwj
         q1quOzJdMQT9aJYsoI74xqHJ8jjdvlzSeT7HCIboSIVG/DpLKeP1gb2m3HlYun5BB4fj
         Rb5RG6G86AbUKgDAxTaeL4khRIsP6pK0n/JrSfaII5ylYW2RWWco+9+avJunBO1kNxRH
         Tq4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzuuRL7TZ4ShTlibQalR6K17Nm4BHiVheY0EouWisreIhBem5QnhzgUJQWwSbDzsgUvzMPPzQobwsY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIls/u/+PC9T8eB/rU1JdSRrCEQSIOggNphDjhV1n8JsHfmw5tf
	gRYx6+CX1HewMgHTzabgYYs2eIn3Ooe0RHP+Imz1FXFz01BYIsL5xKQZSKLm/kREs00=
X-Gm-Gg: AYBFou3MlFPjP2FKgNe4RASkUXR4ih8JTWsoR8pYXfvN43RyUJO1pz+UyMM9xQeqc25
	SHxUeP4LLTxVf00kbSzqOJjvTw8VKpMxaFewRpbKaUXAD9JZ/7PTpNlZGFuojicwotOlmvvAK+A
	XNaI1LqLx5idYzHzQhCOQPzNB1rcu7Zimk5RXzM3GRR6j5ij6I3WhOFuPyIGblGphpFgZ0PTLQg
	mUgadf3S+LoW6UFSheAmC9FZgH4IXxz99Pr6Lcey0rw3LC1LroFxZu26pkG9AuE1OlhL04/Rxwe
	LcaE3KC2r8tDFeRE7N6AovzohbHUJVwWB6reIsxIW2hBovDz5YdNtanm6EJV4XqPI4DZrn3DcPg
	QywEceA5AYJm7eeVhVR3/SkCCf0awurNvLIqjzGx77MozOQCzCjZ9/8FVjS15v+PBn2+mckkA6o
	EE0WNGFbrnZugjTg5SK7EjBCtNCFqWUOycXYcliAiqpKLwdTrkHDPWBvoLbhrYqKNqonlzNdjbF
	CdJZsX5DUMzVXvfdu+ycDN1xw0k2adP
X-Received: by 2002:a17:90b:3b82:b0:3ab:4f1:4f76 with SMTP id 98e67ed59e1d1-3ab3a94f426mr8967011a91.24.1791819872684;
        Mon, 12 Oct 2026 08:44:32 -0700 (PDT)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:7bd2:1202:246d:44ce])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38dd5864sm16692102a91.8.2026.10.12.08.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 08:44:32 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] usb: gadget: f_tcm: reject a short write data-out transfer
Date: Tue, 13 Oct 2026 00:44:22 +0900
Message-ID: <20261012154422.2436134-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usbg_data_write_cmpl() commits the WRITE buffer to the backend as soon as
the OUT request completes successfully, looking only at req->status and
never at req->actual.  A host that declares an 8192-byte WRITE but ends the
data-out after 4096 bytes still reaches target_execute_cmd() with the full
length.

The buffer is not zeroed (transport_generic_new_cmd() leaves zero_flag
clear for a data CDB), so the bytes that never arrived keep the previous
page contents, which the backend writes to the device for the host to read
back. The target core refuses a WRITE whose declared length is wrong, but
it does not see a data phase that simply falls short.

Fail the command when the data-out is short, using the transfer-failed path
that is already there, the way f_mass_storage treats a short bulk-out.  A
conforming host always sends the full length, so only a truncated transfer
is rejected.  There is no oops; poisoning the buffer and ending an
8192-byte write at 4096 bytes leaves 4096 stale bytes committed before the
change, and after it the command is aborted with nothing committed.

Fixes: c52661d60f63 ("usb-gadget: Initial merge of target module for UASP + BOT")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/usb/gadget/function/f_tcm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
index 9e6d4f39900a2..54e45d3c79563 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -1090,7 +1090,8 @@ static void usbg_data_write_cmpl(struct usb_ep *ep, struct usb_request *req)
 		return;
 	}
 
-	if (req->status) {
+	/* a short data-out left the buffer unwritten; don't commit stale data */
+	if (req->status || req->actual != req->length) {
 		pr_err("%s() state %d transfer failed\n", __func__, cmd->state);
 		goto cleanup;
 	}
-- 
2.43.0

