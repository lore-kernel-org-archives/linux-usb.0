Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795396695;
	b=u3ZScD9ExWdgvmHbLnkN3Zde4PCEDFj4KeN/MlrFMQ076JOL2cD4KMC1bmdbpSiDrQMc
	 QbJI1i7cTcU+UylBuN/U7DbQG47nSE7ramTZRsUMvn8rZAc6DECg80CohfdAG0LvIoCO4
	 GfdSeXnkYYS2oTySoDKrdPR1JJsTA0Bkno0EgcOjuMDWB9VsBwGwom8AZ3u9wr0mj92iF
	 ggaQUAMi3rkCGexLq40i/3qztePOU8wJXNwdabmq+Fm3PgX09E02rAklNIqez9UxuN9Fq
	 fttq38kCoXd1Ul7RamHzWYdEBg/aYp1D+z4P5L3RyaxzonIy4hxKNqdTJ9lgUXF03Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795396695;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xtW2k1ILTZk6SZgInS9ZTOwHcWM7IUrJ3JhIcEADImc=;
	b=L7bY5Ye5NlUN89TQjI55g5RpG44tsIvx0AagER77+9iOPpuYunWWV5kK/itvTlKrGOpS
	 4VnIrpJIur1/GINDaOTMW4my3HdWoc7Wt7JRnksz+p1q5zh5ews1mPI+owfppRdQcsEmL
	 yFi70NMlLi6CRse2KiiRsaNVCxMNjINr6VUq34PsRK0h8zdjumdQa+kGgx3VFQN64qolU
	 2AnCJVv6E0ml4Ql6IYIoi3y50IxufBmRfeZJ5Ea2bCrbaeTSskHlo4pDDJrb7WjRD0r8v
	 mOZ+B3cDPZMyz9HxcR/gACE574Tw1yjFGWBrCYiyUanWQ/0/s3r8VnC8ZNX3vcB1QKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mFuLSLXt;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9FD606A32A
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 01:18:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC9FD606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mFuLSLXt
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cdb684859cbso1548234a12.1
        for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 17:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795396694; x=1796001494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xtW2k1ILTZk6SZgInS9ZTOwHcWM7IUrJ3JhIcEADImc=;
        b=mFuLSLXtsbG1j5GBjZAp2dz00pCISwAyPBLpBJZxuDDCE+673i7dcVkcarADldh5q0
         r6juszeA7rUoVaRPm88wToW9tXkRk8vyMM00ZQTO3t8z7KT/R12IZ0rMxOH4DXcE1RR8
         AgQ00DY6J3+VecuyeQ5TNBVJJZhuqib7k1zjK+MrI6KxyNdUTLgYTy9S4F48ds6H/wds
         c6NRzAhKmuN1fLXIvgUuYV2Dm3u/xz9JPfYloc/y8BuCSzTrAbPZEW57Ajaml1rK8T9/
         qB70xVK1krW1l3+paiT+pgZ7UO6czZc6XFSaNlNMAW5fIwLG8mR9f/+anMsS+ShhPFJZ
         DjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795396694; x=1796001494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xtW2k1ILTZk6SZgInS9ZTOwHcWM7IUrJ3JhIcEADImc=;
        b=GtfA+R1rh02OQQOWUcelZiS1bUdVqdk9bAYaYU2lVGrBwsHKIoVR+abymeFj/VET0H
         fxU9NgI15o53wMycadd3rnWlVTzCF4zgbda4FDyEHlGJ60e2hlyli5CzaS7F84sqaWuy
         WrC80nh4XnmHTVJUTUIB4WJhBHec/0+/PJhu5ScxgU9xUHAE3W0BF00rD6wpkDAPWMGo
         x19RDMrTQXQB5GAtljB1yWgwTYzFK+jbJlQHBSTC6g0UMWoSYc0eQHqMVS7gHq7r/r19
         O1BC7AtPJTDwy5hUw2vA4DMk/CcTs7OejQlc09exeLtjcqefgTiuAZ8iZcWE4g+vyCLb
         SUlA==
X-Forwarded-Encrypted: i=1; AL+hErFOtGN6vJMLjBVBGJhhKYgfhi2pdimoeAZVCoKH1D0qmhy4afWUGEvVsBdZ0VlNDW4c0FvZhGy8s/E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DNEVvbyQUiohfXFDBOaiO+YbPju9EdEoJNVLM36tmPJGDycHW
	jshbSpqGOXmGno//uYmgTSsuIKIDqIS0UyeDPowBWBYTu9NDRdQz91Z33BvCfw==
X-Gm-Gg: AZFdTZdWbmKA8/fzWGf9PVCMc5zam7ghFV7cXQ8xL5HbQOGDneN+prplzuQejfzJd3j
	8ddBbvxdEvW66dclv0VlC0PvPvrTEu9vjIQClET1G/lzhxjGLJnWBctQxnzOwHJYN6upohYtfHe
	feWvynpofbSgWUWQFFsmHZpv7MNv0QYT5EwN2bwsidZO+SCEgbk+w8OVxvDuh38BJN600gOqNM5
	GShdl/XIIcwGx4tYBSwR73usv/gBG5ChJSY0l9cTi7lqcSjEMEn/6oqnLZ4JJuPCETtXutPl+Me
	Hjvb7g37vEDAWVJDJJXMa1SAaosBcKaQ9w+L34JRrztxuHCrRFxZSh2Qv+minzUAnBbYH4COYfv
	UpVrZ8mTwdbBeDnV8jsA5Z2/pripftRBKZMZCDF55UECvSM8hW3VNwPMklADe2evbl/mQfCz5KY
	RzLG6qjgbVqlqNwRT58JvW5uAiPc7mUvcRypBfupDE0k5Oet4g7EZkiHYmiTu52L3GFMMoQx1r9
	hMW1QLX2eDLXV0bZEmjofEp4lcJ/j5wlkxcDNzQ6b9xlDwzVfUaBB1R1IzmQ3FlbiLW+hJMiTTk
	q+0Q2R9uwEacoM7m0eH7sO2p+godT+1+1B9o
X-Received: by 2002:a17:90a:e7d0:b0:3ac:b2e6:317d with SMTP id 98e67ed59e1d1-3b41c9e52f6mr9596827a91.35.1795396693715;
        Sun, 22 Nov 2026 17:18:13 -0800 (PST)
Received: from hanzj-mi.. ([157.185.136.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41abb1b66sm15587206a91.1.2026.11.22.17.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 17:18:13 -0800 (PST)
From: Zhijian Han <hanzhijian1991@gmail.com>
To: gregkh@linuxfoundation.org
Cc: andreyknvl@gmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+d83b3c49738aea97c0e5@syzkaller.appspotmail.com,
	Zhijian Han <hanzhijian1991@gmail.com>
Subject: Re: [PATCH 2/2] usb: gadget: raw_gadget: fix memory leak on connect event failure
Date: Mon, 23 Nov 2026 09:18:09 +0800
Message-ID: <20261123011809.1033045-1-hanzhijian1991@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026112020-sesame-uncut-fc8b@gregkh>
References: <2026112020-sesame-uncut-fc8b@gregkh>
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

On Fri, Nov 20, 2026 at 09:17:32PM +0800, Greg Kroah-Hartman wrote:
> On Sat, Aug 22, 2026 at 10:48:50AM +0800, hanzhijian wrote:
> > gadget_bind() allocates an ep0 request and stores it in dev->req. If
> > raw_queue_event() fails to queue the connect event, the function
> > returns without releasing the request, leaking it.
> >
> > Release the request before returning in that case.
> >
> > Reported-by: syzbot+d83b3c49738aea97c0e5@syzkaller.appspotmail.com
> > Link: https://syzkaller.appspot.com/bug?extid=d83b3c49738aea97c0e5
> > Signed-off-by: hanzhijian <hanzhijian1991@gmail.com>
>
> Full name please.

Apologies. Please use:

Signed-off-by: Zhijian Han <hanzhijian1991@gmail.com>

Best regards,
Zhijian Han
