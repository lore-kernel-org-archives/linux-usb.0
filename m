Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794886998;
	b=0gkVWQEGWxnffPUAsJHOgXHAhM76eU4AvHlSjGdsgO44rv2GcgOUWTnA8T7tl1C8sSqI
	 fPs/UnqTn0M83aNdRBgoMCdQ0wop7x1KGVbLg+G5xvUr8/UBmCJhUmIkGcLF54S9IAoM7
	 qLUD8lJ9hM39RdARTlouUu+k/EdLyiabTGLLvY/SmpzUJmWdDfcFK7YXjfIugq52XcyLx
	 X3p8UxHRmH0BlLtywQA9P1yHMRpfssooio0qd+nqEaSRbfUyj60NFl2YMiwxAq1bnTRmO
	 G3znoDnsPDZ0p8kEwVPb5uvnlF2V0LZw537mh97uwqKoBhODSqJM5TkHNGdGmyGYBuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794886998;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9sUaLBG4g6dzJOc9/4AaliEDYmASDrXp9FJ3nYk2ywM=;
	b=OmCqh3AjJBeJbLwyRO1J+cPyQN70Hz4ZQyAoyNM+rIs7TsniBjqOu+2irJWtnAd0VBCT
	 RpmYXwijPQxpvjF0jHYfsaYCd1HGYgOkz1NUYcj+CkOwpN2nHIKXtSPUKQIjNjfCuUKMM
	 B5uACKJEuzghiUB5O+LQtXRB1X9/aKPaQDoqVqVY7XgASqxfsbeI+przQN/Kvp0zwRZX+
	 lHogEmclR4eghc+M75leyBzUYmc3sSEdVX0uGiJklQ6SGmR2y4jExqdpxJt1g7CvpOFAa
	 jmdJ3tb2x5yQkUjZLO3pV406dUDoHyqD+UMSm5+fxeACyUbkftuBFBWm3uuvzCbTf6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T+HFWFMo;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B880606A323
	for <linux-usb@vger.kernel.org>; Tue, 17 Nov 2026 03:43:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B880606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T+HFWFMo
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so7950870eec.0
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 19:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794886997; x=1795491797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9sUaLBG4g6dzJOc9/4AaliEDYmASDrXp9FJ3nYk2ywM=;
        b=T+HFWFMoOFKw7GyOZo8LVPrXSiF2tlsYmn+gcTYIjEYUa3QAlOmkpHUp4f38dIAyZm
         9PA/qrhEittVlTmtIOVGgrikVlQWz/zDFrm++nZwoUHk31CWcnA5PQtQpmx4UOabIN+S
         2wD9qzLT7xjndiGoduloq5poveNYrWxEkNNl+hrY2pUcCpGiJtU+Sl15CYng6qts5VrI
         ka7AuVHBrmDCjPIGkx84qrWeQnaMCfqI5N0TrtcFbT0o+3jrnITnUJi0s3Ccv8fEa4+P
         W06nqknX0dq01WR4xWbMthdU5CXCc0PuQLvhaWe02u+A3WAdbydyZrx+kO1lr633JMRC
         2wSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794886997; x=1795491797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9sUaLBG4g6dzJOc9/4AaliEDYmASDrXp9FJ3nYk2ywM=;
        b=soswZeTEHx+LgZvD1dDozs6Q5F5OyiM6uPrraSjYY+EgM1o0pNFmO671ReLjREF27o
         OlKQqPOrMCnzrkQDAwQAymooZjkdEVt+MfoVA6P1MdNROO0xDhkKzvDa3zjc1tdXiGpZ
         Pv7H1ni3EijxbP0Uyp+SVZOwl5JinwFR4x10nz1LrL3Xq8yKth1bQAz2xA9vR75kC52S
         ysmvZyy62Kw3fDVESy/q0ywSID+WqQAWvAlII6BK3m90RMoV26icUgVdC9usHIar+UVH
         Lr895J/0TU+odLnF4uq3ynwafpOMZSJT5JyzhX5hrIOzKIioSR93Cr41ynw869gxV0tQ
         HB1g==
X-Forwarded-Encrypted: i=1; AL+hErF3YEZC4qSV1Ko46AXQlC+Pg79jBGR1ENFEJhUu34CBeurW5r9wLWfECM3KPxRekNTxkBxz+9xNh9k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2f9UUA8dnh02UPVkSU6bdXoZ1eovgO8bUvSO13EQMvvjRL5II
	rWallJcXX3rP1IjDzzQPXyaNyIVGgQ9u7odt/f4AZOBa/yhTWu5vmjrs
X-Gm-Gg: AZFdTZdCCuLGabx3B+IZIIrd3TBgTSU+4Z2RUOSuzZRfcvTsZzYptHREUlL4EE0uqDs
	/Lo6lffqxuqgzIOqrcJU/itmgyPfCFNlQ5L90leQP1xEy3dMALgBHG6ISLkTTr0wtFU44vCxFqk
	UsB8otyGVzjNGBRUKYV3B4k2BtgllRoHpXT+SgoUeF0TckERXY08YcBBiffJArIFUHD8o7+f88e
	9kbj4gFcx01Wl6o9Z1Ev/fe25NDp9H2Hg3u01UOxU470Cd/EPto5J/UKQK4LfaHphnQRq/xI3V4
	koJmNgK6bZXOUv7Nejl2Ifld8srY0IFjSMheLEHhIEBtMi8VM0v0OdRfkHonrEj22rMsWQcoeQ3
	OSH91J4xjic5UY1UP3m1JEbkqTfS9WmkQdP3ZCDQSZVE/mhSzZQyqw03ggbP9r7vIeX7ROnWrwr
	rNbnDX1DkOQhgRs4B/4HSGvtKE0lJ72M74BSNgcoZtcmngKKnEoXFaFEo03WdB0DWW+MrPlzYNA
	GO9+KYQuHxLIy0+f8Rj16YhbhCkZH6FN5Q1lYpCf8lBilKJ+IuuMR+g24eP+Cb5++xc8Ke332B4
	l75KDxIgygQyewFcDjZe+ad0pO2kwhhzQVeXzbH35FBvmP3dMeDVatsJ+EdpQsEXjmpnVkXp/Dh
	fVRHdrdvqPOjg9Q==
X-Received: by 2002:a05:7301:182d:b0:376:a6d7:8f60 with SMTP id 5a478bee46e88-37967ae21dcmr12790578eec.40.1794886997205;
        Mon, 16 Nov 2026 19:43:17 -0800 (PST)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-380d5135221sm4037710eec.24.2026.11.16.19.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 19:43:16 -0800 (PST)
From: Cheng Yongkang <teel4res@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: core: use the clamped bMaxBurst and Mult for the wBytesPerInterval check
Date: Mon, 16 Nov 2026 19:43:11 -0800
Message-Id: <20261117034311.538314-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <77330361-136e-4e26-b5ac-9c4259f90978@rowland.harvard.edu>
References: <20261115163701.226491-1-teel4res@gmail.com> <77330361-136e-4e26-b5ac-9c4259f90978@rowland.harvard.edu>
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

usb_parse_ss_endpoint_companion() clamps bMaxBurst to 15 and the isoc
Mult to 3 in ep->ss_ep_comp, but then computes max_tx for the
wBytesPerInterval check from the original descriptor. A device with an
invalid bMaxBurst or Mult can then keep a wBytesPerInterval that the
clamped endpoint cannot carry.

With wMaxPacketSize 1024, bMaxBurst 16 and Mult 1, bMaxBurst becomes 15
but wBytesPerInterval is limited to 17408 instead of 16384.
usb_submit_urb() uses the clamped values and rejects isoc frames above
16384, while usb_endpoint_max_periodic_payload() returns 17408, which
xHCI uses as the Max ESIT Payload. The same endpoint context gets a Max
Burst of 15, so the two fields disagree.

The rest of the code treats ep->ss_ep_comp as the sanitized copy of the
descriptor. usb_parse_endpoint() checks and fixes ep->desc the same
way, and everything after parsing, including usb_submit_urb(),
usb_endpoint_max_periodic_payload() and xHCI, reads only these copies.
max_tx itself already takes wMaxPacketSize from ep->desc. Before commit
842f16905dfc ("USB: remove the usb_host_ss_ep_comp structure"), the
clamps modified the descriptor in place, so max_tx was computed from
the clamped values. That commit moved the clamps to the copy but left
max_tx reading the original descriptor.

Compute max_tx from ep->ss_ep_comp.

Fixes: 842f16905dfc ("USB: remove the usb_host_ss_ep_comp structure")
Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
---
Report: https://lore.kernel.org/linux-usb/20261115163701.226491-1-teel4res@gmail.com/

 drivers/usb/core/config.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
index 0e79b7f8a73d..2f031ea6a437 100644
--- a/drivers/usb/core/config.c
+++ b/drivers/usb/core/config.c
@@ -170,12 +170,12 @@ static void usb_parse_ss_endpoint_companion(struct device *ddev, int cfgno,
 	}
 
 	if (usb_endpoint_xfer_isoc(&ep->desc))
-		max_tx = (desc->bMaxBurst + 1) *
-			(USB_SS_MULT(desc->bmAttributes)) *
+		max_tx = (ep->ss_ep_comp.bMaxBurst + 1) *
+			(USB_SS_MULT(ep->ss_ep_comp.bmAttributes)) *
 			usb_endpoint_maxp(&ep->desc);
 	else if (usb_endpoint_xfer_int(&ep->desc))
 		max_tx = usb_endpoint_maxp(&ep->desc) *
-			(desc->bMaxBurst + 1);
+			(ep->ss_ep_comp.bMaxBurst + 1);
 	else
 		max_tx = 999999;
 	/*

base-commit: 3149e8b3237f58d4dd440fc64c45c93404c4b064
-- 
2.34.1

