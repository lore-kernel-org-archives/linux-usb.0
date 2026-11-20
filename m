Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174283;
	b=o/8UXJW8YZgNPJOplWMkNRiOqgW3DiDUJBGETYr21RguZDtOAiL/GpA0rY5qzRdeTKqw
	 +bpfnupSxK5jbdL4/bTYAnAPPF9z1Pg9F6SFCE1sr8cvN+4OalERsvMlZsEWkXUwS6VJJ
	 q1CVmWxDojBo5e4d3+6GQ1T5pNxHOLhn/cInxCx11/Ensz09jRMAtb6GqNHEJHM3qHwRT
	 fAJN7cawJF4dRWBMdOv84fkFFlLchLVELOOuw/0O+dc/0/f6ILswI6WbNa2YGbVm9ud62
	 PjcXv8CHkkWar++Wq8XByFW8CfynQ4Mx+KQ1W48d2THI5c6+6712P0zoWqksbOyMhJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=RX+856AUzmCTNUy6Uoa6YuVj+X3zQhsWSDJ5mJQKXuE=;
	b=eNt/SQ3x6vfXh+HOnPL7WGnAfzTqEf84dLSSj42nowvuGfWERyI8HyP+L/l1XOYYjL9T
	 Zz12DLByahIj4QW2XmOCuceQP0pqKOh5eEQUythHA8Rrtvy94OvktCLou2Hm+owLkMLdU
	 YNA3IzdPYHEKUvvI9OP+zF+nL33+oXtQHhaBinbRQbaigk4vU2/Qbj4dFCux/LzL4mMLJ
	 6+gYfU+scQmq8qh3y3OZiqEtfGKW1DJl4raarz64se3JAN+mDu3v9qfoPEGyh52ckMmnm
	 MKqQkIH5hnZbhABJYagIpiZ8bvRBulI+ODGpnnfKcMwCgqzPbQPfQ8iuIn4U9itXOdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=d8Vxng05;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380E2606A325
	for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 11:31:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 380E2606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=d8Vxng05
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc751eddf25so588550a12.3
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2026 03:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795174281; x=1795779081; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RX+856AUzmCTNUy6Uoa6YuVj+X3zQhsWSDJ5mJQKXuE=;
        b=d8Vxng05FQgd+fvSGYsdHS5kgqtkzPNIz459SZ0oYQW/AouySIMAngko5Z2WRDOonM
         Lbny+vFRNti8nv+xdvTzCkZ1RCHyMXDtMPygPkWmtWpX6jT0RMXqOstAkgeH3pvROnGD
         UOzmqYy7h1yPOzvakLnvQfPt80Gc4oay4wuNmhmMGl434SPvS1fXuIhlUy87tjuvpfSx
         e1k2ts6CiQ+sEujcdCLZsVk3CsG7Az7qLLWaROFPqBueMZU4f0G2pSZ1OOrrd76bSYOb
         Bzoo+nijHDZsii0L2lCJAu/xCKY6HB4t1T4Sn0CdqJ2EzyID6uHkek2ARQFrYLx9sq2P
         GCcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174281; x=1795779081;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RX+856AUzmCTNUy6Uoa6YuVj+X3zQhsWSDJ5mJQKXuE=;
        b=kNNRXPbtSv/6HCrxeki5pBU/cj8JSLY+YSg93MDYc67zNoZGb1ApksuRw/qPxIDQ00
         tOAF97PKfYEk89MRc8zD6uk5SR6zxdmq/52CfiGMGzRFQjzfktRidvpvSulUHi0r/9OL
         svRvm6GYQZynV5Gx6j1187vh+3u5ZmYZ/avlW8972qyDhDuNym13JXN6bAHO3Cn/gBy1
         y11aZvCLrVYsWRsbB5P0zwb6pOms89ggFPDEE70dvp629JNfYo+8n4/8Y+ybvK88U3WH
         D/gjIOEMG3BJhxrwFQureVBIDHCUU5aOAlSFXP2gY6+8464CwoBDdbM4RrfqcdT8uYGV
         gvZA==
X-Forwarded-Encrypted: i=1; AL+hErHHb1CG5eo7giJOtMeQTMN0e1t/AmT4iHq05CzblWFSPenwZSHNV/MLO9RbgEN4Bwwwg67CIhqBz8c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8IeYketm+lsUJwHv8SQCUvZUhTX8OvXwO7uYj1PwRU8XVEAi/Z
	2CJYL36Q6MPS9Vp4KdUv70n3iDlm/JSoXsAF/3IoOhCYyrpJITPTfc984UkCvnSHF5w=
X-Gm-Gg: AZFdTZdLsoHyBOiaTZEW6IFxc4DrLgDDPx3Y+zSgyT0/BP+9cg9mKEZkgbtA5yfDG8l
	PC9U5C/E1ldTVVhl+PzxloLRusbLTzgkl/LGplDe/kevP/0ixObjuoT/mz7eYoExUm1UUQFMMpd
	lplRfo7K32PBO8vSvv1r2Al1aG4ElQe1MOLq+5Mzr+DSkgUGcZXcLPTdhguSe/GmiphV/IA3DTt
	8egwKfAsysZWgsf5Fgpod4DkHssWSrvfPLlRPJGYe8MfSX6W3rRgXq1LePiwh+fJ6mb6WewzjFp
	mhOn0owB2teQhEyxuVlT6OUFtOEXlvyNDl+Aigmsd4J9Szu96GMAdD+3tKJ7q2c4t+CjDKJpCED
	lLxwaK8uO47lcvTCfSRXrT/oXua7sNg8pchQcme/7esAkbZ2DpMogvmKF/GqSG5baXn2LtiRYzi
	IK5VIZF0U6TDlpbW/VKHHW51aGK7NrZD1NJSU3hxBqt1xSq+bmTuYclNi81a7lkTCVO9FX2r+/L
	4lUlXT9anRe1DVd+e+B44Dkjfkmrc5AUYnJK2D/r40+BhL6nrHA6L2+iuMcsu4WN1chv8qWIb8z
	2tMd6lA3F0Rj1KatOvXoaCMJGjQ7yOS8DKwLhn0wgV/UHWVjo5wBn3OlkBHI09V1TgyBV5hkPQM
	otI2PXE1IAEgGEdTmuTOn3C5TpmXYvX7h0uBq
X-Received: by 2002:a17:90b:3f10:b0:3b3:b8f1:f152 with SMTP id 98e67ed59e1d1-3b41c7e1414mr2197961a91.2.1795174281280;
        Fri, 20 Nov 2026 03:31:21 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad47091sm4104731a91.10.2026.11.20.03.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:31:20 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	linux-usb@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] usb: gadget: f_tcm: reject a short write data-out transfer
Date: Fri, 20 Nov 2026 20:31:12 +0900
Message-ID: <20261120113112.3060035-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026112028-starless-aching-bdfd@gregkh>
References: <20261013043951.2534225-1-yhlee@isslab.korea.ac.kr> <2026112028-starless-aching-bdfd@gregkh>
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

On Fri, Nov 20, 2026 at 12:09:52PM +0100, Greg KH wrote:
> > -	if (req->status) {
> > -		pr_err("%s() state %d transfer failed\n", __func__, cmd->state);
> > +	/* a short data-out left the buffer unwritten; don't commit stale data */
> > +	if (req->status || req->actual != req->length) {
> > +		struct usb_gadget *gadget = fuas_to_gadget(cmd->fu);
> > +
> > +		if (!req->status)
> > +			cmd->flags |= USBG_CMD_OUT_SHORT;
> > +
> > +		dev_err_ratelimited(&gadget->dev, "%s() state %d transfer failed\n",
> > +				    __func__, cmd->state);
>
> Why is this needed?  And __func__ is never needed for dev_() calls.

It's not needed, I'll drop it.

This is an old version, the current one is patch 3/4 of v8:
  https://lore.kernel.org/all/20261118124005.2428068-4-yhlee@isslab.korea.ac.kr/
It has the same change, I'll fix it there in v9.

Best regards,
Yehyeong Lee
