Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795005631;
	b=iywlh4Hj7VZXh4QAXDRlqKHEIhqCpcOzLKG4TIiut/KSIm9PdtXYTbxMLFzy1b1tNMtI
	 Pm3YudkGjR65qAHFqtMoi2iG3a2I0BrvAGjD6glN0JdpvVxpFq5uZ+rmu51x8rtGxYKQi
	 vme5eEh+5ak5lNHma9uaUlDUVbth5gdYtJYlN+NKAsHQ9g6y4vwrS3nSQDnyYthPs2znu
	 yRzJDghDAUI/xdMjS6FPiOuQxNIwiP+56ASSGrB1fubZtneQbWs5AvzVUud2g1Ryz0Ggj
	 dR3oXuuvPb+h8B1FcYeTWBHeDcGKpgCdul2emBtIeD6P9k42hQHRA3vBXnhgalO9bAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795005631;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LkQIR6xullmNca58dESOLHq+G6witr/d+tJ0Hc+yeYk=;
	b=fdKXWurnEMyQAaZIJHScKXPNF1QygopV8klSne0nGmt9q4Z2VcDA+JSR9iKFxjXhNUfS
	 1bk38U4nL3WlvIgdzwMG3FQhDw3KEOxdss2kpISKXTiKuPYB0iWUCQNyFbG3yZD2QJYnf
	 SQhjUz4SDD+OHObUWy+S1oIMa2QbKfYiwAPzM5DXv+cBoVLm3xBZ6VHVcxQ+m3WRUKdJp
	 istt2EeRHtLnrKLIQ7bpuqB1Vm/mjK5/y8uW2k8KSDa59iwTzlVTVULPf8b8j5GeHbAnc
	 yfPREcrTFVmfXxFeYvZMSPsIX7bCOMZdU5zO2ecpsDOzJn90Udkkvgf32+EI0Xfl4VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rWKI3Tdd;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8758606A338
	for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 12:40:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8758606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rWKI3Tdd
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ae1b34e0d2so1181256a91.1
        for <linux-usb@vger.kernel.org>; Wed, 18 Nov 2026 04:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795005630; x=1795610430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LkQIR6xullmNca58dESOLHq+G6witr/d+tJ0Hc+yeYk=;
        b=rWKI3TddjM8acucdR5sJ+4iTrnxQQMVeyJR2vXKW73kZ2BAlNP1g/IedL83z6fQoOh
         kFZmN214kJYrJbke7O1ArUouR08RhXy6klodXf2ZM1P2k1S65FiK1Jl0L3YEevNtjCRP
         ixN6KQYrnwS0fiLZ9SK5zUulqHyA+kUjdWyk1l+7GKjteJH328QG3drzydYZxmQdfwiM
         G2bmaaO1v2qLK2P4BgjlMxDSWWjHoKMnb6iOzTfGIOV/ZDjzTlUwlMtt/9lnsheeM0VU
         asD8f4pC/ybzLyF7n+U01cEPuK/r6KBoBgrUku7XJbCGfjnDpc7LNeKQGFsPPgwKgl1+
         hxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795005630; x=1795610430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LkQIR6xullmNca58dESOLHq+G6witr/d+tJ0Hc+yeYk=;
        b=NSSrAc9EIqTjVPrRiFPbqiCCUcIJo8zqH7UIIXI4ENntLJ6wO84Q4cEFuu08/fF0kc
         y0wBAIb92jD5y1I6Oiu9o5A2Ey40KLW+Yv9OIZHt06LTVRqxKbK0JlUKVRVwVjQVsNds
         531SYVUJemIM7GDDngaKNf9fgCyzaDpr5DAQEb/ucmRvZfgivbODOwJr8tQ2m+D1Yn/f
         hs7cRp2nXlqb+4/sGAAP2qC96KJ2QPT+AJ7cLDlTwt9zp90/2+E/lZWwqzQVyWudyHwU
         u9OsiYibOccY9nT51mYwhIqtbmXh3xBAHVBovitoSO1bRhiIizVm92c8L/cz4Be9sypP
         2hNw==
X-Forwarded-Encrypted: i=1; AL+hErHfdC4yxxLZvhrpnoHUXm1EKE8jPhIuuw9OmcUhcU2JWvhufWoc37GJFPtp/YGVCv/9zZpjCS9V1Kc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rQf9JSBUl7HzRz8wAziNVo/t6ttcLwy18wFsNRu2Vh03dSQ4i
	LSTVuJSzBlTE2sms81SLokiO7OQTbo1oHA4klyv6hSfN+Adla54SuWxeF6pShnng4lI=
X-Gm-Gg: AZFdTZc6CAlplJvuXtth/xh4rjy/gtZYYqvL8Kio8fHtnazVq/ZW+o5ggP/e6yn30yy
	R8QJ3JNAr+dS+ZZv7GogcgX2tjJUdSnD0t9L5jXKfrbdEPBl4+vPqnuUazkfH8Pd2RrTVuAGJ2N
	gLrx1iUQoIvaEBSvauJ6AwWaLTJegbISRzfuhCJEKRlblVJona+Hqc/WOb6hJ4A8AwC0zxcGt4w
	XUoe2jCXaP6QK7NL7N+dtgCEFn2F3t3nmcswSzW1D0MHc1O7kbl7NNaSCm4XiVmPU5ikw59pKIH
	UxyyypqQ3U9V+qeHqGiYtXThWKspVUFTU7DtO8sIPB8ujk3i4LMSj3UiHArfFh/0PNytgOQTldO
	XPSiajttMidrXvcAeuDWstEQQo5aX/409YKN+gb7vpYM+nyYg1hW5jvx4tQxUIXU+N+mYawI5Ds
	R2xDm2iju+ErWEVeE3ZTpTY69d/OE7Pzbc7oIGcx7++U2n4IskHdnUBYXSwo6Q3zykP9kgw6uSf
	1SjzXgOjfssWmv8U63k/y2/0CMTsZkVM76RQ4z3nEtaEDAlfc5wBMZLZsNqr/fhlZMpmhPOvHMl
	+v/+LlaM9qX72gVOtYOf9F2BYAUfmhmeRD9QgoSehJbacmV5y8qz5GC9Dau02Bap9Mxck6nrWFZ
	eW0DamQzydBbD7a67D7pf5sn74M95Zfmu953G7A==
X-Received: by 2002:a17:90b:518c:b0:3a0:cca0:4a8c with SMTP id 98e67ed59e1d1-3b3d07bef79mr1656925a91.7.1795005630028;
        Wed, 18 Nov 2026 04:40:30 -0800 (PST)
Received: from localhost.localdomain ([2406:5900:1044:110c:e78e:f7f0:2120:34e7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d19b6e18sm4257980a91.10.2026.11.18.04.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:40:29 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org,
	nkapron@google.com,
	linux-usb@vger.kernel.org
Cc: Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benquike@gmail.com
Subject: [PATCH v8 4/4] usb: gadget: f_tcm: clear the scatter list when reusing the BOT status request
Date: Wed, 18 Nov 2026 21:40:05 +0900
Message-ID: <20261118124005.2428068-5-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118124005.2428068-1-yhlee@isslab.korea.ac.kr>
References: <20261118124005.2428068-1-yhlee@isslab.korea.ac.kr>
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

bot_send_bad_status() reuses fu->bot_req_in/bot_req_out to send the CSW or
drain the data phase, but a preceding sg command left req->sg and
req->num_sgs pointing at that command's t_data_sg - set in
bot_send_read_response() for a read, or usbg_prepare_w_request() for a
write.  That command is freed before the status request runs, so on an
sg-capable UDC the status request is handed to the controller with a freed
scatter list: the controller reads freed memory out to the host on an IN
endpoint, or writes host data into it on an OUT endpoint.

Clear req->num_sgs and req->sg so the UDC uses the linear req->buf instead.

A test module that stands in for the controller's queue path, so that it
dereferences req->sg the way an sg-capable UDC would, reports a KASAN
slab-use-after-free on the freed entry for a read command followed by a
rejected command that reuses bot_req_in: 20 runs out of 20 without this
patch and 0 out of 20 with it.  A normal sg read still queues its own
scatter list.

Fixes: c52661d60f63 ("usb-gadget: Initial merge of target module for UASP + BOT")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/usb/gadget/function/f_tcm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
index 970dba09d75e4a..e2ecd5922ee77c 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -140,6 +140,9 @@ static void bot_send_bad_status(struct usbg_cmd *cmd)
 		req->complete = bot_err_compl;
 		req->context = cmd;
 		req->buf = fu->cmd[0].buf;
+		/* the status request is reused; drop the previous command's sg list */
+		req->num_sgs = 0;
+		req->sg = NULL;
 		usb_ep_queue(ep, req, GFP_ATOMIC);
 	} else {
 		bot_enqueue_sense_code(fu, cmd);
-- 
2.43.0

