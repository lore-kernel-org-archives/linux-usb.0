Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793417026;
	b=dn54skPmRwD9oZC0BgHis/SGvUMAg12Q73HQEL1kKEtrJ7+POsrR1O133DBi6Xz/ZmBV
	 BMT0m6XQRVnOJw0tdisp9V5OhUMvSnrbREQLtobQZGRc0qxe2jK0X6jiFV3i2QI0Kpzxs
	 DNj7oqaDJrf4/eHwrDSknw04KEXl4ji+3mSn/9gnE0JK2X3YNZOLzu9rKw05NY374oRR4
	 3TjFMeidqolBx1sHDcAOckDreowjMYzS7tsHt2sFFRnEN/6SX8kfwQwFtNg/lFCIypRFO
	 47fvA5u/jmU6uFZm+wJQdpc5pZNWp29OT5nc8Nr4kz+qgTOdvjltlXAtEtSPM5pvqbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793417026;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0eCNLkg4i1sXeD1zhO26Nw1DB7i9APGYPUhXMjBTbII=;
	b=qqoO7DijqQCZ/wnDjiu/+p6KpkOxGf3XJoFwGqWKJhL2rkFfGG5Lq4fhHDAH5YO6dmhY
	 nuQvxewGxvbo/ds1D/Gid9rRevvX1Cak6rSh1NkuG7HXV+FMRTDsXUmkZrvc3pSLFufPa
	 BXu1O5nTCmfSJLA6sVo5Bp+wFlaP60iWPlRq8jQ/PTq5qCgTO8XS5R+5Q99esETbXJd5C
	 ZHE+R2KLUmErwXhW48M1YG1ug5f8hwLcUcm6i2PFW7vAUXUwtCg4I/6c2DKArwRcXQL3A
	 9L9Mu2BxW94TiOE+8ZaTpE7juP+x5BKf7NZhV3y6vfcu2igfVxjCae2SU88AD3HpPsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=riff.dk;
	spf=none smtp.mailfrom=riff.dk;
	dkim=pass header.d=riff-dk.20260707.gappssmtp.com header.i=@riff-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=PcyntxrG;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04969606A31C
	for <linux-usb@vger.kernel.org>; Sat, 31 Oct 2026 03:23:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04969606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riff.dk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=riff.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riff-dk.20260707.gappssmtp.com header.i=@riff-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=PcyntxrG
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1846bc43c28so1594916c88.0
        for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 20:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riff-dk.20260707.gappssmtp.com; s=20260707; t=1793417019; x=1794021819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0eCNLkg4i1sXeD1zhO26Nw1DB7i9APGYPUhXMjBTbII=;
        b=PcyntxrGenqvwflPKtfpiqMP39CvBoWYWUSAu0ciAJSFL56zhrxDiPo9eFTa7vbfaj
         mg9lNLxfFFiTRRqP0TO5k466uRpPA6NAwRKMYo6timJpvsGbdR3vqR7S5etmiBXKELRb
         1I2x/e74Ll8m+RNNFfAEzm+Wzcl4KfJnLNHhytv4ErIcPCc3J+7mRkPYbo2eTKtfuhRJ
         EEfBLjK2rEgpehYWCTCeKOpOOhRgd3gN/FVWSwLusVFJc3j+e1PeLfx6018aVOZnUgrG
         iHbokxDQby7EyDsCKT1MjDVpstIx7OfvCoVY9OhMAEo/S8icyr7ibgID9LxguCcjWzYl
         HsdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793417019; x=1794021819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0eCNLkg4i1sXeD1zhO26Nw1DB7i9APGYPUhXMjBTbII=;
        b=2nGhp0FiaaTru5y+pBlLTcnAPTtFVi7Eo4OZ+4rqnIPMdb3JNKSSNn2GP4fwLJvAv/
         Jk1zmaSFomrfFRb3mgQvkTBvK3RrkluC/RFpQJSaJPP+KNXDJlFemTsVeb3Fuqp4zBoA
         pwAkrl1qv/Xj2Wq0riF1NW6Gswnb8CcPSNkCodgTcpFKgcZX57K/5gA5/Qc/xvpskERr
         qBG/Aa/0prDFkVbGQnk9cmm8xWBrW7p5Rq4rkl59vthsp7uTLdYgjGWyR0bm0/7QgzWp
         no6kjNXYctBrDh7usYP8u+XRGa7p3sveUCP5ys31eTmLkekOFdqRQiH9u+8pJtSOvoPE
         WSwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzH/nkEVhK3LVcUCATU9DprNO5S/gri3jPSIOdXvoAC4pCm0fl0kWkswpAeIajpcjxSLZxcxgY8paE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKV5uhYw0M1ZEi7uAMceou8CTIm+VAKpnzeUxlu4skLi0VQsPZ
	glSGh0ztFikgwywTJxzmYZhSJ3VTgrzgmk8vZujaZ4ZqgmSX1Saydtecq0DvYGwMDQM=
X-Gm-Gg: AYBFou1gZWrwrRZYlnrbUdyUGspbuCXliru3L5rDEPqCTZtNVe1SEYnQE5amwyKVTqO
	PYfdmuEJMqR6sFPXTD9e0p5CBJ3VRkx3V1ZJ9OdDcm0TcFhGWs+uC9NxTv4VTLclg1R7iLoTWUD
	ZsrXykh8/bfBPZdYIaem12tu+FS4Nk29TekpW8CLjCFVisZ9txmq3vT0xPvq/WggMyidPJnFAhG
	qFxpYaa79NmBdn70w2QM1bsxHFByi20N6rQyj3Nq8H/yycyRwV/zXBmm5CblxJ/ukgk5gXzCWjl
	VY/WfTnM+OYu9aBMSPPoau15aJPkF9tyijy9RdnB/9ThJMTLj6dumel1SsG5QaANqK2uDwrFN8g
	3dXXKIuCCPRRBh8fQbONN7IBFUKTzavtEn+F8KENJJzQ+rYcbNNkgAiVnq+8LZZ7gFGZYjbOLJu
	QX0CEBAOImAIOvlQo8QN23HMHmHfRBvH6SGkGF7voRPCGF7zuKDDWRbgqIAdBKcS0AdOowA0R2F
	GuuJvB/mJHHB4bhcPCequcax3jGTt4r1k8G9lxVByKGwKb+exVybJfZI5zYoG3WdO0Zb5a6nmeq
	F9rV4OvyldXf6XYDsXtUkb4VBCjuIYSVwyG8HxY=
X-Received: by 2002:a05:7022:2097:b0:1a0:b650:5c93 with SMTP id a92af1059eb24-1ac5e8e1e16mr5492166c88.41.1793417018649;
        Fri, 30 Oct 2026 20:23:38 -0700 (PDT)
Received: from jrx1.tailbfbe03.ts.net ([2603:8000:8e00:53bb:333f:40b4:73c5:a898])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac192c27cdsm18083809c88.10.2026.10.30.20.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 20:23:38 -0700 (PDT)
From: Jacob Riff <jacob@riff.dk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] USB/Thunderbolt driver updates for 7.4-rc1
Date: Fri, 30 Oct 2026 20:23:37 -0700
Message-ID: <20261031032337.37451-1-jacob@riff.dk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CAHk-=wjGk9rBTphk1OAwcqGAE1__KJgMr3B-8X4hKFPX8Wm=BQ@mail.gmail.com>
References: <CAHk-=wjGk9rBTphk1OAwcqGAE1__KJgMr3B-8X4hKFPX8Wm=BQ@mail.gmail.com>
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

On Fri, 30 Oct 2026 15:28:29 -1000, Linus Torvalds wrote:
> and honestly, this all seems rather excessive. Retry ten times a
> second, for ten seconds? As far as I know, this has never succeeded in
> the history of this laptop, and it has no bad effects apart from the
> silly messages.

Hi Linus,

Sorry about the noise. As written the retry catches every -ENODEV,
including ucsi_register_port() failing on the role switch lookup, which
no retry can change. Fix follows in this thread: it retries only the
PPM-not-ready case, for one second instead of ten, and has been through
six boots on the machine the retry was written for (three hit the race,
all recovered).

As far as I can see, the -ENODEV in your log can only come from the
!CONFIG_USB_ROLE_SWITCH stub of fwnode_usb_role_switch_get(); the real
one returns a switch, NULL or -EPROBE_DEFER. If that is your config,
UCSI has never been able to init there: TYPEC_UCSI builds without
USB_ROLE_SWITCH but then fails on it at probe. That is a separate,
older problem.

Jacob
