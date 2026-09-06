Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DB43BBFC8
	for <linux-usb@vger.kernel.org>; Sun,  6 Sep 2026 17:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788714737; cv=none; b=aTZ1aJ+D0oCSAWCkreR02nwVCDJSUoTit3K/ZGobs8XBaejwAi2eeHtEzXvk7OpREehpb1VLwdQvCcXfgUUqf459f0sA5Ozcbm8e4nrssCZOkvaDHxiA1i4n0uIrBpZJIg7niOqxQCwf/oUtOzFBW1Xfnlqv3HARZsYN78aHiSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788714737; c=relaxed/simple;
	bh=qH7n+ZKbHZj2oVZV1KwU9ggB3Wiy0B9LIUAksky89H4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=K5bXwCdBkNL2dkNsJWyi/dplQHGIZm71EOyL9Kcbj/OPKk2UcMVE2rlfw/tB4VY4qySOOx1I0N1CePGPZ52QG2OEbS/WCyjFdHSSWvuN03+bnURukGa+Uh7qrTK54hCmmDN4Q0F4AqcNKnRONG6c8FNZPF9ZzTeyi4III92pVP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e2Gjg0CO; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e2Gjg0CO"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so2971746f8f.1
        for <linux-usb@vger.kernel.org>; Sun, 06 Sep 2026 10:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788714734; x=1789319534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cpRopDThQc2kdnNNe0FC4eQLPhj9iGQQR15LcuBfIzk=;
        b=e2Gjg0COk5g7RRp5zBUWphIaXQWwMBpp9HLdWtzhdRtJFh5ZjInforiLGhQTu4/TtI
         +OhwZ1zFiFfr91AXySvI+Rqo9C6q3UVgdudr5sbRn4ElV6OtWm3sYvFemh6d9CwJb1+g
         70POs3fCMEhCKcQppd0BYiqfJhUos/M9P8X17CUf8vg/vug6w99FohbYWZj3TtHQrLLK
         VUQYndVmKWu7Yq6I7yUuUTW8072GbJE1FtWhbWF3EMBLroBasKkFKK0TOqUCOTd1p4px
         VWJ8n6oPI4hx6bkgQGctaxuGs2OJPQh5JoQRuR9EvcZiGVWbZzq6IeOy132zkezvj1By
         eghQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788714734; x=1789319534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cpRopDThQc2kdnNNe0FC4eQLPhj9iGQQR15LcuBfIzk=;
        b=QuKfAL4OCJ12uonE3A1RJYejKsw25UtNxRv5jrPjSHljsqeiUh4hTwkWUMNa39uJdU
         HOSbR2TGHldnm011b0Of4pu3oQLZrHug98Veb8FQw1tsfIITR895WKnslg+Rq1Dc34Pw
         efSJe7EJVOmHDLk3Q0hMnhmHN2kz5GnlhwhJvFJAfttrVnOMQ5+2ff3OyZVCsEV7+t8w
         8N9RpPvWRYks2HeGGy2V42Twza9Ql1bd1A/ydRLalIQOVhNdL0sjziI+0rwTFMvckT/M
         KnOCvfESN51X9abv9DJYk+IdagyrjdoxADPWqVEDbeLCW2C99F9Djl03Mb7wxW6xbFA1
         8hCQ==
X-Forwarded-Encrypted: i=1; AKwUvBw4Dnmul5u5SAcgs9Xvh5tOEpYntnMj0yMvy55QCkP05wE8YkLoBCAP6+iUfV7+e9ULyT7YBpuyMFI=@vger.kernel.org
X-Gm-Message-State: AFuF++kZlyQSMdu9XAGHyM5nxvywYFwdXqLy59aaxEEFqvN+5dTbY+O5
	HvKIDJU68vUcDzTnl6ylMvmVIAgEBPge5SyMjOrriD1IDyBC91JeIizX
X-Gm-Gg: AYBFou3PzmZ1faYVE8i/bXX9Owa31HacfpBBsQLNZKZd2j7Bj76D5aneukJByUewqNR
	HV87WMwgi59zXwbY201y4L+1dyXZh4ZmR68uBngzsBAMlqNgYeP3KpYb+UnGHG4hTLWB/uoDVYc
	eMYSQNwJ+nJKc6Jv9bsXFy3cnKmxj1TVKVx3yP9mFWhdCMimVUXI2u/9BFqoD6HfKu0JM/P50cH
	yYR7AWG7/Kqb4I6DsWcAniJ6WUwOxb7a6IE54ZbRXk7lch3Kx3UzyYNzersoFJOYVld/U5stVEj
	S1/KaB2aF4+oSrJedkQTn1J+ceI/q1vbSxUZkLKeaI0Ya80GrF6qKv7biXPy9B3B72o0fJgxjGN
	ptLXZZmSfPH7z/TSgqjKKnLKUHWRSuclWy2qLEbMiJxWBm6wE2peg1IyF9bmFe7LZCN5HWKd2/Z
	D0Vdlc36HY8IfV2t8MNguWJnCOZ8Ti8tw53s+iUNYTiOwyZp7u4QS36W74kOx2W8MIj5nlNjTnP
	1bjYuhS7wj7a20hfTr8ll5x+7DYl9rr2/6/tJqmekihNKb7sfUA9VRd7l+/hn5h5/Iwo6jFJDbP
	lhMrlZWsfqRHjKDmRD7VoYpPZRu6xWFhAv8pOlVFIoemC/T51meWutRSaC7RrQqmYE8Ebr4Y
X-Received: by 2002:a05:6000:4804:b0:482:e451:6810 with SMTP id ffacd0b85a97d-4858703f65cmr22834368f8f.1.1788714734178;
        Sun, 06 Sep 2026 10:12:14 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9d84-5101-9c80-d25b-14b6-410c.310.pool.telefonica.de. [2a02:3100:9d84:5101:9c80:d25b:14b6:410c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883a9234sm22493371f8f.14.2026.09.06.10.12.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 06 Sep 2026 10:12:13 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	linux-usb@vger.kernel.org
Subject: [PATCH] usb: usbtest: Fix the pattern parameter description
Date: Sun,  6 Sep 2026 19:12:10 +0200
Message-Id: <20260906171210.2661-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The module parameter is pattern, but its MODULE_PARM_DESC() names the
variable behind it, mod_pattern, so modinfo describes a parameter that
does not exist and shows no description for the real one.

Use the parameter name in the description.

Fixes: 7f4e985448e8 ("usbtest: make module param pattern writeable")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/usb/misc/usbtest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/misc/usbtest.c b/drivers/usb/misc/usbtest.c
index 8759df49be28..e2d7087c28a9 100644
--- a/drivers/usb/misc/usbtest.c
+++ b/drivers/usb/misc/usbtest.c
@@ -337,7 +337,7 @@ static struct urb *complicated_alloc_urb(
 static unsigned pattern;
 static unsigned mod_pattern;
 module_param_named(pattern, mod_pattern, uint, S_IRUGO | S_IWUSR);
-MODULE_PARM_DESC(mod_pattern, "i/o pattern (0 == zeroes)");
+MODULE_PARM_DESC(pattern, "i/o pattern (0 == zeroes)");
 
 static unsigned get_maxpacket(struct usb_device *udev, int pipe)
 {

base-commit: 986c24e0fe44f844b44d365b71ce831947f50298
-- 
2.53.0

