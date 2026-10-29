Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283230;
	b=ZkrhBGHyYutjF3Obd8nfSlkP7caiW1yU9bta7xFDxj4m6GpG9yczlZxO4qBJgN2hc9GN
	 +MOSQYn3o/q4FtW5CTT4GM/YAygpqT9KrGIBge5z+Fod+V6WDbb2IW7Ckr3HbfR2bk/xP
	 Mf4tmPQ4waqK0nzrURwWqJuLk2gyS+Ix4YWCvP9GxpRLi84/dMJJzsc8d4pDClkXj1GYu
	 v3+dbVWJ8m+mMYBt5t+shqO+vs9RPgZ7EYAeYZkVTz2+28nTOtWBqDX0YcVG8qZzxl6OB
	 a8lKNZf7BTHsMJvJoqSQdna9DliqGqDOnv/5yxF184KkHIX24VqKXKMl+9RQZa6+oNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 In-Reply-To:References;
	bh=/pgvkliCtPwsMB5opghN4hnkUGvheloeM6QC61uhwW4=;
	b=VzFQl89LuacQsJtXjozchZFs9Ya83i0XXcfGw3cl+2lSjXT2w9j0t3JHfLH6HAOmhyCS
	 /njocmMiHL8Eg50+ucVtKNjjGckcSAC08hIsqx4qx3MwJnWFBEsIK9xelXnGg7LqCUK+V
	 mWKaiSuePHvJOLx8b2Y5QZ1aO9TwH2PBn8vOKH7jMdgJCdKM6JYuRY/ZwgkLKhcFH7GNu
	 eX+cyjodWEjDFXT8FOLm6Or4PQWujih6gquyy43j5YG3fYLfi6He1XlE5Peoe877rsQ2H
	 56Mo4NV5s/vPFfSJVpumyLVwjJI9xkIGWh32MzYefJvtPcx3wb7GfOA6wkfDrVEhPgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DF3Cjzhm;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD18D606A324
	for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 14:13:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD18D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DF3Cjzhm
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-188406bb948so1977078c88.1
        for <linux-usb@vger.kernel.org>; Thu, 29 Oct 2026 07:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793283229; x=1793888029; darn=vger.kernel.org;
        h=references:in-reply-to:content-transfer-encoding:content-type
         :mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/pgvkliCtPwsMB5opghN4hnkUGvheloeM6QC61uhwW4=;
        b=DF3CjzhmlM9IJqbtGZXmOmN7QIc7vhVhZcNwF4TUdiKQgvGNnWv+j1cc+4sFidQhSx
         HLgbdB5kDi6xm3t4wMoEWD/uTuRtXjtveqkpj75tIR/FvRcfDpjnissrh+3EukTPdo/O
         /tUOFgNAp0vgFBWGQUJ8DysHEfYg83XLgm75XXlI+MNXsEhbGbbxxasYSoansehTQwug
         5OdyOolqifDtQVkrvECT4o0ZP6XnEIGZwuGDa6Rk6y/miLbkaFoQYoNl255SKs3/z9yk
         VZfXMOJMRg8NBuQ2fcd/MLsrSWhMMptxKUJgMOGuMs8yigKIln7NK3ES7m+YiFrqMwme
         MhWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283229; x=1793888029;
        h=references:in-reply-to:content-transfer-encoding:content-type
         :mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/pgvkliCtPwsMB5opghN4hnkUGvheloeM6QC61uhwW4=;
        b=xmgd5M1ASgpXUYEXMv4dSbZLrIHE0jVV8AP+7aRZdQy9uA4OOduJXo6nWYt3j28kfv
         oGfZ2IOveOIidapXH0DV8nYxwe3nPp/XeSJCICUB66ctg0E4X4qsswe5sWZ0V82mga9e
         AvDxFpfyQ7+uJf+DOn4hE900r1CPqOsO6twLsWOIdM5AOr9maDAuI7L//pk0i5zt/vvp
         RVj2xhUJBudzNbLVKqlbqn90J4ZVL0noDHttFq6TgBzH2BcZiykxirsDFeTyMoLoD+NR
         mBiOUnEeVGnMGe/C28+IQq0MQlrXAZRAP2tCjnRJRtHSxdoefNLGDB09l43ag7yO4OJi
         ea+A==
X-Gm-Message-State: AFq9FYK+xCtOHnrSPiecxqpBW0Y20SAWvflZtOwsnWne3xW/GDaZPQal
	gF7ou8Fn6a69FNF7PdavkFToQqjB6z5UBiLqiiiNcZxNp9yAplaF2Y6f
X-Gm-Gg: AYBFou2/0Dj50Myib0InYcOIiq0CE4WfpTGLUIWQdGwpMMVUGhBcM7gMi2GvqCxwl28
	XTPyicXOIlMPg/CIBq+R0sPmfJF6lx/HyvvMARrfsY8FntF7KyN9oStk3nRI/o0ZM2tApJhtgwv
	IwJsEfww+DBKUloiJ+r/zAn0J6VlVLnYwHttWGV+vhltVWBhdqv0AdX1QqO4hiqtZpJPIXY9buP
	t9pv5SVHFAxAGFxlLLkM2v+L7WXeZFBBeq86pPM/u/zZw1z+Er2jol0IhNOmskP+TYw53VcM9T2
	4fv7MrWQWSwAk55CGHsh9FBZIbkTUmO0iTk0OK60pwsLNF3CC1s0rsMWEKvs92VwamVMyZBNiwc
	b/jx+CYPXrZVGWINrVfjI1L4UDKnuRU5jGOxvahNj/9g5M2bs0AVo/IxnnBCOwVoQEFyK42TPAA
	wsL3N5J3vTa3FP+juuTf8MT9wyMDtVeG6N3ZDeQjsffpoAfWyRK5AxKwTRdDY731DyufPMqOMIF
	xS5QyHq+jhLtJ6QeHmI3L6p6+avU0CjevYyIk16i+sHKisVfRc2g4/HC9VAVXk2CZquBRMcxhAY
	s4cxQ3ZnKmiEYd2DQByh1YF5/23ccNIin6iJXxTx7SakVq69wt0d7w==
X-Received: by 2002:a05:7022:e01:b0:144:e535:3ef6 with SMTP id a92af1059eb24-1a6d02bd6e6mr9786281c88.41.1793283195990;
        Thu, 29 Oct 2026 07:13:15 -0700 (PDT)
Received: from [127.0.1.1] (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75d76814bsm15197319c88.10.2026.10.29.07.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:13:15 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 [PATCH 2/2] usb: usbfs: clamp the copied length to transfer_buffer_length
Date: Thu, 29 Oct 2026 07:12:20 -0700
Message-ID: <179328314074.648427.8187049654053191605@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
In-Reply-To: <179328314073.648427.8311262845412746237@gmail.com>
References: <179328314073.648427.8311262845412746237@gmail.com>

copy_urb_data_to_user() uses urb->actual_length as the number of bytes to
copy to userspace for non-isochronous URBs.  The usbfs contract is that a
driver must not report more data than the transfer buffer holds, but
usbfs cannot rely on every HCD or device implementation to honor it; a
malicious usbip peer can already set actual_length beyond
transfer_buffer_length and trigger an out-of-bounds read:

  BUG: KASAN: slab-out-of-bounds in _copy_to_user+0x79/0xb0
  Read of size 88 at addr ...
  copy_urb_data_to_user+0x36f/0x480

Clamp the non-isochronous length to transfer_buffer_length before the
copy.  Normal URBs are unaffected; the isochronous path already uses
transfer_buffer_length.

Fixes: 3d97ff63f899 ("usbdevfs: Use scatter-gather lists for large bulk transfers")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
---
 drivers/usb/core/devio.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
index 101cb94..9554b6a 100644
--- a/drivers/usb/core/devio.c
+++ b/drivers/usb/core/devio.c
@@ -557,10 +557,13 @@ static int copy_urb_data_to_user(u8 __user *userbuffer, struct urb *urb)
 {
 	unsigned i, len, size;
 
-	if (urb->number_of_packets > 0)		/* Isochronous */
+	if (urb->number_of_packets > 0) {	/* Isochronous */
 		len = urb->transfer_buffer_length;
-	else					/* Non-Isoc */
+	} else {				/* Non-Isoc */
 		len = urb->actual_length;
+		if (len > urb->transfer_buffer_length)
+			len = urb->transfer_buffer_length;
+	}
 
 	if (urb->num_sgs == 0) {
 		if (copy_to_user(userbuffer, urb->transfer_buffer, len))
-- 
2.34.1

