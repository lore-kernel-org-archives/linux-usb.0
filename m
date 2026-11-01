Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793516821;
	b=LDfJ7d21R/hnTfBLXJz9M6osv7ZdAi15M0svRz8x8OBkHaS9ltIWOAGLLq+Y7QP5qUDh
	 4Uo5pzI/6Ny6fJf9l7FPHlj6zKNnDA7zpE2lOjqHS50Hs4NhYgrclRCHuGu68woBt14LT
	 dpS9/qDptk0ij6kGIo7JZuNRPfIwmF5yIKCoCcC1flfqlqqF/OjNuJYXkDRe8ukaGs4/x
	 otea6/Mbd8mOJBu+Kc9TNy1vVAXXSx9et1jeGTpSUH+zsKmnThKbRqkkocBo8iLYuosuV
	 ttebXGfdSM+eh7AuJqNGXnITB2V84+rvtkcU7OCaqfR7ttME+Yv3FPFVacsfQqo3r0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793516821;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=mFt6fGnh/wAL9vMX1ZE2GCohPi4lZBYlsen3hpgedRU=;
	b=cn8KYaFtcqWjXBRX1n22nCbcNA/us8MAazgFayrYM0UTq1eoFyhAYO7HHzdTkYNL42Ma
	 E9hNCpWU39JAeRCbZWtXX0BlmKW5lMUkW7tji5iiWNy6PXXPOGn2JQQvzi52ippetCfqI
	 7dOaPpVYe7DKjvnyVcfsvIVHlK7y+kXq9vvHLVB1b4iX/Zye2EV1Jy0hSKZVCVkWDMNmo
	 WlnxJrIQHGIID7CmLh7ULDFsYwsbQmPrHzrw5WBsX6MDoeCw5moIk0d9MqZ2M3+JTOMS4
	 IyNkc/EPktslKOANqTPRPPrzYnsrdhOBs0fCzbCaBPk4eemrwBOSl0ThwFqUEy+4NHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WrP3Z5c0;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091F2606A326
	for <linux-usb@vger.kernel.org>; Sun,  1 Nov 2026 07:07:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 091F2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WrP3Z5c0
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35b2c599f43so2528725eec.0
        for <linux-usb@vger.kernel.org>; Sun, 01 Nov 2026 00:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793516820; x=1794121620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mFt6fGnh/wAL9vMX1ZE2GCohPi4lZBYlsen3hpgedRU=;
        b=WrP3Z5c0WIDja8/FWc2pYZbtMRealbAkM4qt9EbzKfKVucEkvBTDGnalr9uCuCY3lk
         paNq8B9Ypp5XHuPTzr3Z+5NPI3msLEGzO6viDsh5+HNLuligNmwFeZuZFC+NrRu5fwYt
         OXBzNtQ/pqYdIKsWEb+vzpru3HkcVnpoP2Hi1e0mRzANd79H5+l2DUi16LTAli/MH8AS
         MJyqVzl+0BnYq37dxhkE0jM47LTtsbQMpO52KJpDwyIkW2p6hCJGbL5wMd2AXVs8iaxz
         JizN4nwgc7prvmXFnUhBr3ZV7PbO5lrQ15bXBcBHub8VAF22OxqYPEa5RW2ZPYazL+g/
         eWgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793516820; x=1794121620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mFt6fGnh/wAL9vMX1ZE2GCohPi4lZBYlsen3hpgedRU=;
        b=SKKIYSRAsW4+JS4YWeL5ndwCuoChh8rUVxn9XSBFFOh6TUCvxcZP3KirDgRLREUsOR
         sVD/yo+zdaAOPggKl7bvOv64ntLsL8ElMDEQaBfIGAbF+LYpHS2NdyR+CcbrjsvPbm8H
         a0s6OiLFtqVSC5IdvKccqvEjg8isH32vkJ7QDC+6FI4oRLQLhFu96V8fZwQ21lDS/QXm
         Gtwgijn9hj98AEakc2k4nH35TAeE9e40Nd0fdxeWwt1J1zXJdXs4MgcBQ8vBAdVtjo/E
         ycLo6L52GAOJjyLNPErzq4AIEcRlnv3STX8jBrMtNFtQ3DjLegqDoAUQwwHDENo8C2lM
         ybFA==
X-Gm-Message-State: APuU4Z+9KqyW4aJ8x+/kP8q/sl9G/J0lGZM7w/fOKQTM29H7wAuaLwYJ
	ZFlOr/nFtWzGcuLfvFSiZtjRktRLVwWknpFw7Hj1WotZYGOEKg1YIv+h
X-Gm-Gg: AYBFou3F/dCNkAQAPPfpk39e7+nb5NCBaabD4MSZ+1aJYAdDj5C3+VCnGE+RLUQal1Q
	m4e9UQliz29H7H6Su2g4vqB8lwq1Qy76he/Lm3DAGVOePr6mnhr68U7vXN7+d1fv2oirn5vq1rA
	2r7D8mRhVtg6IL2wYVsdgrvS1TSD9wq8wlgLhNB/eg7XVK7+qIGeYpQsy4Bmkcc/DtD/ngTFNZg
	QBtbyfyuKLnrF++5nMufumPabBvo1+N8tUGhL1cucbC7uTwwGTcNoapk7T9bDyZV0zaDVkEi5mR
	Ch/6HBMv9N6a6BRtvN3yRh+X2J6XUgfdhRaeWy+t8zYwSoyy0mqRAPKqQgbaGCv+WspbdmFUIPq
	0qKxEH9OYCCHY5oVWTP2HderKEakxQFUgBYqEu9DNVZv31yXdUVRYTmupNVAZsEbcPMHs3XYlej
	z8LNDGSq+mU9d/CnLgfFdsRJg33ruU+Mtgt2z4khn5j4IO1pkGzXTyhbKfCZyJQt2wupofzAqNt
	oLaLMM6fhGTHwN2kQnxaiqGysXlc5ouhpMW8h2IqshLcO5kgRIaeV2IS+FxJXX6Y76P+WBAf6cC
	8x4pgKqJs6kLT96X1M4eAVjZPSpACaC+KFFw7vzu7ihBFFf6eOOAgMrPCi5DvtMV8ley
X-Received: by 2002:a05:7300:6ca2:b0:366:fabf:6273 with SMTP id 5a478bee46e88-36a423e35famr15750922eec.22.1793516820039;
        Sun, 01 Nov 2026 00:07:00 -0700 (PDT)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42669128sm25922591eec.3.2026.11.01.00.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 00:06:59 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Hongren Zheng <i@zenithal.me>,
	Sung Byeongchan <tjdqudcks0424@naver.com>,
	Cheng Yongkang <teel4res@gmail.com>
Subject: [PATCH v2] usb: usbfs: clamp actual_length to transfer_buffer_length
Date: Sun,  1 Nov 2026 00:06:51 -0700
Message-Id: <20261101070651.1846947-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
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

usbfs uses urb->actual_length from the host controller driver without
checking it against the buffer it allocated. For a completed
non-isochronous IN URB, processcompl() and processcompl_compat() copy
that many bytes to userspace and report the same value, and
async_completed() passes it to snoop_urb_data() when usbfs_snoop is
enabled.

With USB/IP, the value comes from the remote peer. If the peer returns
actual_length=88 for a 24-byte control-IN transfer, usbip_recv_xbuff()
rejects the length, but VHCI still gives back the URB with -EPROTO and
actual_length=88. usbfs copies data from failed URBs too, since they
can carry valid partial data, so reaping the URB reads past the buffer:

  BUG: KASAN: slab-out-of-bounds in _copy_to_user
   copy_urb_data_to_user

With usbfs_snoop enabled, hex_dump_to_buffer() reads past the buffer
earlier, when the URB completes.

Clamp urb->actual_length in async_completed() while holding ps->lock,
before the completion is snooped or can be reaped. The copy, the
reported length and the snoop dump then stay within
transfer_buffer_length.

Tested on usb-linus e971f4f365ba with KASAN, using a synthetic USB/IP
peer that returns 88 bytes for a 24-byte control-IN transfer. Without
this change, reaping the URB hits the report above, and with
usbfs_snoop enabled the completion hits it in hex_dump_to_buffer().
With it, the URB is reaped with -EPROTO and actual_length=24 in both
cases. Full and short control-IN and control-OUT transfers through
usbfs still work.

Fixes: 0880aef49e40a ("USB: usbfs_snoop: add data logging back in")
Fixes: d4a4683ca054e ("USB: usbfs: only copy the actual data received")
Cc: stable@vger.kernel.org
Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
---
Changes in v2:
- Clamp urb->actual_length in async_completed() instead of only the
  copy length in copy_urb_data_to_user(), so the reported length and
  the snoop dump are bounded too, as pointed out in review [2].
- Fix the Fixes tags; v1 named a later scatter-gather refactor.
- Send separately. The USB/IP patch in v1 duplicates Sung Byeongchan's
  earlier submission [1], which covers only the VHCI receive-failure
  path, so usbfs still needs its own bound.

v1: https://lore.kernel.org/linux-usb/179328314074.648427.8187049654053191605@gmail.com/
[1]: https://lore.kernel.org/linux-usb/20261009122636.642575-1-tjdqudcks0424@naver.com/
[2]: https://lore.kernel.org/linux-usb/sashiko-outbox-189547@kernel.org/

 drivers/usb/core/devio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
index 101cb9425..7319e8b98 100644
--- a/drivers/usb/core/devio.c
+++ b/drivers/usb/core/devio.c
@@ -633,6 +633,8 @@ static void async_completed(struct urb *urb)
 	spin_lock_irqsave(&ps->lock, flags);
 	list_move_tail(&as->asynclist, &ps->async_completed);
 	as->status = urb->status;
+	if (urb->actual_length > urb->transfer_buffer_length)
+		urb->actual_length = urb->transfer_buffer_length;
 	signr = as->signr;
 	if (signr) {
 		errno = as->status;

base-commit: e971f4f365bad51d01bc90db55b56fdb3124f963
-- 
2.34.1

