Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174349;
	b=YHspCxOjQLiKaxuEd7g28IjRaSvE0phnk2d815ysUakqutfpckxF6Kh5Ht1jMM+5KJsA
	 Z3SRfyDpGLroqPWNRqRCq+G/cDMCP8LydsxDx7UGjpbEat726MTDtqe/klfaiG3HQMguy
	 lw2Oi852by93Shp+rIBlXHr9wGq+A6oLIolIU2VxZZznN4Yfv3qihOc3vWaAS3UgFINk+
	 RQ+lulVwyMQgRhMM7N+IAyy9g6r892nymhiYnBMuyEIJ1+AVNvgcsQFuUFST5CSfIGNon
	 1Y6AW04VLWSgys4WPnz21rmw9Y13ltX6mi3uXrEycTjvmUWvEaRNullsQivVbcfWf1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=oT+e5zei8W9zq6B7ygBEpfry0rHVJnLOEe7Dp9Xm5iQ=;
	b=lNO6Zzs0qfvUnzZpy2rVHj9cmwxnvnj7U9ebq3OvhXt3TNT+mBxfYaSNUWqtMx45zz1u
	 ETRuwBkHmIEA/+sJprI8xht324uqzWkyYWRzfZMYrUAf18SUUORRe8JF9XyFuVRuFKCCm
	 jTKsCP2RwRHMrnYchpwUZcUMrULwDvpUZjTCrniTvzrCCmJuAZrpKIaV+uUgnlv388E9I
	 Lh8UDcXD2ItkcKgkC9QLNPxrjIr6WJDQ4mKA0e9s3LP0KgNNMQ0NUXYmZ8kabPXDmzeXn
	 dZ1z7WMkBvyHXrAQ+xcqSC+MtnwiYUK52IJBSzZzF00pNFAsHUoW6rMS3z0+yfKoCAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=I9l4jCPO;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3B760A2604
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 11:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD3B760A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=I9l4jCPO
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2f03920c4a0so4943105ad.3
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 03:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795174348; x=1795779148; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oT+e5zei8W9zq6B7ygBEpfry0rHVJnLOEe7Dp9Xm5iQ=;
        b=I9l4jCPOg3s4jnVn9JbxVQCPLY1V+MobJ680af7AuZNKjBk7eA+YRPaAmB0yhXoIxt
         QQshzrzYHQxrDTuo3Djua4arc8Ha5nzzoI9DqFHylBe4TCKxUrxw95NYujJqZ3VaVdvU
         HqWkktDJYS0t8LUWSAwoGr788QxKfFP8QbL2Q7J9GjDUw4TEP6ujqaszk2kX1t1uLX1E
         RbvkE/tRieqOPy+0g+N0cRXhlgrn2OysQYcibsg2RSw1qIdlgTq8g5LpnKJd4v7WU4CW
         Um5HyrcfKKBAuRZHXk4qj+Ytvcrmp5oLyuygUYLwr/XzoqW6xbC0x0oZvBJo/8+fXKig
         c7JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174348; x=1795779148;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oT+e5zei8W9zq6B7ygBEpfry0rHVJnLOEe7Dp9Xm5iQ=;
        b=Sbxfi8J7hg4XqdMO3qbz+KsCWakHoEeWbGTSnw8TEbHE8AqwNqMFb/wrPvP/3y389A
         tVVXabhyDl4IMzKgEbxncDPGCVUBWNPrBUs5joYkSggWjaDu3JM0kUojtTwjc8LRBGVC
         LbCdNGU8KxhcUcC00xb7hsB9yvAyHiQZttMeTrtnaB53aatLtHXWdQIIN11IKdvVQGf3
         kLxfQ/+t22TCcEOO4frEivnfsswY0Ryl7TUzJ2AvQySlP7uhY+Zkb/zZDyTCDyfMbU8I
         mh4VdgTqw3dIqk+2vKlCZgVPe2IA9KijKcmuMAIx2ZyEkxPKsRr3XPACi4+RhTDMwwG6
         VmNA==
X-Forwarded-Encrypted: i=1; AL+hErFHudfHloRex67Y0u+3A9EnwFmkjL2wc38m/1aRcjMN6mBJBWRU3nDiMAzysuoogSKT0Bch0LQmW7U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YXSjnA8iuz0xyaEtcNP6gwvEWZ/bUFwiRq7PMwdPkxwIKQJ6q
	xGH6DMTqcYhYW+YJzmsuX1wFHpucbUTYbrUPkUSfAdW1ygLCY7U8tfR14ybXHoLArnA=
X-Gm-Gg: AZFdTZfrnsuCt0Bhx6ZYujjf3+vLVLZIqczvyKQQxj2cId0EDVyD3aO559s7Ym0gKaY
	0rJg9sCsKNgi+9sG4C45jVA9mHDjD5DYKsZXzR3onXoXeWNWqiTPaBxa5Rb2dwi6BOX8Iv34qDs
	iBhIR3B0RMewKROLgA2zufO2m4PCTW/UQnXgXjYxSulZbLf8M+wrzVcgDasVc6H3KrGvv6/d7rX
	S3VNjIotpYr71FCv6D9hXUG3Pxxd38jllVF3C969+h+c/qnOu763mATEpxImXaN9vvL7eklFw/X
	BKZgJL9SwfVDg/cuuSVBrqeoQjP8lTV2Z9OZOIj4NcnoFQEiwAR5fxW2FBviUIJ9wfJRilqav90
	3o8Ze0NYWr2PiIEmNUZpaf4Av0WRs10qrSK0zWBGWJJ2zaQwQq8KU0lH9hkf4LkBP6uq7EQTUEi
	hE6fjm56cQ2+v8KNn2Dh3/f8UWkYhp4nARNqe+jjUWe0MDqG/ZhdNDyLW29SSdWCv449QZh97Cr
	3mq37DajG9mmqn+FLdjItRX5+RjBZNQZasv/Rog6SClJ0zy/h0y4KACBKLH35fn+sX3c7z5T2PL
	i/XMdgsH2nWeciu95bhe2aqMl2YPssC6q1imBXx2dMyPu3jq6wQ9mUqktKlQs5a3PWSxW1zkMJP
	ia8qWh6LOPQv76vgahElhRWPYvtR2ps0qnarN
X-Received: by 2002:a17:902:e741:b0:2e9:d0fd:639c with SMTP id d9443c01a7336-2f03f1ea747mr29262845ad.55.1795174348092;
        Fri, 20 Nov 2026 03:32:28 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee848c1sm13247705ad.10.2026.11.20.03.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:32:27 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: nkapron@google.com,
	Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benquike@gmail.com,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v8 4/4] usb: gadget: f_tcm: clear the scatter list when reusing the BOT status request
Date: Fri, 20 Nov 2026 20:32:17 +0900
Message-ID: <20261120113217.3063855-2-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026112046-thirstily-cosmetics-1aca@gregkh>
References: <20261118124005.2428068-1-yhlee@isslab.korea.ac.kr> <20261118124005.2428068-5-yhlee@isslab.korea.ac.kr> <2026112046-thirstily-cosmetics-1aca@gregkh>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, Nov 20, 2026 at 11:55:56AM +0100, Greg KH wrote:
> On Wed, Nov 18, 2026 at 09:40:05PM +0900, Yehyeong Lee wrote:
> > A test module that stands in for the controller's queue path, so that it
> > dereferences req->sg the way an sg-capable UDC would, reports a KASAN
> > slab-use-after-free on the freed entry for a read command followed by a
> > rejected command that reuses bot_req_in: 20 runs out of 20 without this
> > patch and 0 out of 20 with it.  A normal sg read still queues its own
> > scatter list.
> 
> Why is this paragraph here?  What does it mean?

Sorry, that is how I tested it.  dummy_hcd doesn't do sg, so I used a
small test module in place of the UDC to hit the stale req->sg.  It
doesn't belong in the changelog, I'll drop it in v9.

Best regards,
Yehyeong Lee
