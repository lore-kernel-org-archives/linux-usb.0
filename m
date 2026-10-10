Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7D01B7910
	for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 01:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791596995; cv=none; b=mHyKksLNOL7VrBnb4QmCdN2Ac5K82RM5EUp6hBAX9DY93S5SBKZl+1gCiWRk649E+gsqV5UkZbcn1G30aBHpEw3+aPjYIkrnGVcHG9cerCukcsDI5Vt8iFSiST64NNuGNyXG/lhefevVbnlbzKQZ+DON14xYYQkIBmiNsGSvoiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791596995; c=relaxed/simple;
	bh=W8wqps2u7akJN+4Ig9t6psXDckfkXSUUQ2f8o0U8UZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qDpFTrDz2vcUazF1V60zi0T5SMsTMfH9krcH7A88mCenlH6jfSo/R9GfoHWhzKff+FSPJs8BQk2CaY60moLnw9whJwBPrTC/83gfQ4D3bh95DIsueHffS76gfb/UH1SqO9FiU9WXmMK564v+OAoKfG76dK7COrWqT+XN3tAWUaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=h0rv50zN; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="h0rv50zN"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91986c5cb75so5043196d6.0
        for <linux-usb@vger.kernel.org>; Fri, 09 Oct 2026 18:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1791596993; x=1792201793; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HX/UZz27MsL/V4wPwo8QU7r3MDtmRSA6wmc9p+u+eaw=;
        b=h0rv50zNK7QcikP3OMWR9EdOF2nwETLIZmWWrZ7fAA831dFE8Vyefmcech8nSkLGf0
         CRkGUfgaEjRjAVSpjZ/ThMl+LT4g7dsIx7bOAxtHY0Xhr2d73OqVWQY/sJaI1QLw17W5
         WUiFVUwol05yUlIGOhOPVqESG0Nd9ORb40InwqJ1W6vK0jIZfDEXW/YVTpB3BbuRSJlS
         8Ww/cynKNshbsqR8an72oczLqAQz+hUcGefw/4VQfOSw5KpADuLGK/tFr56z1PZXGLu9
         mSce69P4jdeB4pYXlBqoO4MwMPBF7r8L/zbfZl6BEWi6RZfYCwl0Uza1l+YuZqZt5WkO
         XmTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791596993; x=1792201793;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HX/UZz27MsL/V4wPwo8QU7r3MDtmRSA6wmc9p+u+eaw=;
        b=j9Mg7Ah8cBhZ8PDiJd6QcbhIY/wG2A5YAJ4L8c6emnrYxzqQm64uWVZ6/edzrgliFn
         pO6PUEQFfOH+gTyA6ETgDaclam8xwOM6D8oR+GEssdA5VPSLLMhCodh/D+WLk+eQobo/
         DZ+R8vxl2LGRttzwIVZ2YkbxxUYSjX+8zJ6mVkua5QNZCGuMAs/VyJZ5gVwgDS85IF4o
         DVL/NT8mfCtX7KviCcaI22LnpXTsgTd1S5aDguFks2qeQEpL2CZhaQ5P3HLE2zbkZ8Kz
         nKSGmm8hP1yVUG0+IeNFz9JFnrzvMI2q4nrczxD4xkbFhXydKMl5tjgi+Z4a17gtD5wK
         0CgA==
X-Forwarded-Encrypted: i=1; AKwUvBx+q2VDHy2LnHYuAl1+3Zxv/CB/GFffTiChDHB4gtZl1rP6hfs8gDkK6cQd5YhDHBn3KDgdNQudtiQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIx8PximzGrYsf8XN6j9rK8vslf7TVTqyOmp0JXqPuvSMdLJqzV
	gv2zNX+mGOeP0StWVBofmhfY60LkfEuWoUbF6nGFWr15OcedLNrM7Ryv8g/YXDNB9Q==
X-Gm-Gg: AYBFou3JjLxjaO/cVcgRLcRc3p7dT5PXfZhv1fZ9844fybQeQWg6iYQu6K+7Ky9fhHY
	R2x8pdNUpWCrytTelaMl4uaftaB2J76gp8NUIOz8hS5rPKzTKgupFtilAWEzN91I/xAc9fUKsg6
	B+KGJapLkYZ6Iqoi1QV6cMgyG3Hg070UHkV2SuyuqPCMigRuNWJHdNAsVHmNxarn2l8DhhQL236
	xnS5zFqt8cq1hxITST4Pt3cwXbGGgwJS6OeW5/miQ/MAJSsAelsqkjl+b2DW48N6yffrL3Zt8V9
	wmuIzAWvsyz2xakd635bB6XUmXkh2orgs+3ypdTOiWDCSqql8tjzz/PH5HtmjY0JpjKGyFiNXAB
	65L+pm1qWd880/bXWxWZnOBcp+27C9mhkmWUnJ/MpbwMJrD2RoBSybXX9q51/LqQxxE5YlWPWeh
	KNp7lsHb4+1eAGu8HxvqhjvJkSK+jPkmexW+sYVQaCjTA3a0WbWTkekStylfkRUFWOzQeSqIY=
X-Received: by 2002:a05:620a:6cc3:b0:93c:6028:6d2b with SMTP id af79cd13be357-93ebd208cf0mr636124685a.43.1791596993106;
        Fri, 09 Oct 2026 18:49:53 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::1b7d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb98c5633sm316485585a.35.2026.10.09.18.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 18:49:52 -0700 (PDT)
Date: Fri, 9 Oct 2026 21:49:49 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: mosafer <mohsafer@gmail.com>
Cc: dakr@kernel.org, driver-core@lists.linux.dev,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, rafael@kernel.org,
	stable@vger.kernel.org,
	syzbot+863936f50214e843ae0c@syzkaller.appspotmail.com,
	khiemtranzo532001@gmail.com
Subject: Re: [PATCH v2] driver core: complete deferred binds when
 drivers_autoprobe is off
Message-ID: <0cc7fb74-aa32-427e-a931-dcbac7ffdcf9@rowland.harvard.edu>
References: <DM06HWVAFSOW.2F050J0BT27TK@kernel.org>
 <20261009182239.283329-1-mosafer@node0.quickhttpnode15.cloudfaas-pg0.wisc.cloudlab.us>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009182239.283329-1-mosafer@node0.quickhttpnode15.cloudfaas-pg0.wisc.cloudlab.us>

On Fri, Oct 09, 2026 at 01:22:39PM -0500, mosafer wrote:
> On Fri Oct 9, Danilo Krummrich wrote:
> > We've recently had another patch to fix up cases where dev->driver is
> > pre-assigned. Please see [1] and the corresponding thread.
> >
> > IIRC, there was no reasons the remaining users can't just use a proper
> > match() callback instead, so we don't have to worry about those edge
> > cases in the future.
> 
> Thanks for the pointer.
> 
> I had not seen Kien's series; looking at it now, we are attacking the
> same half-claimed state from opposite ends: his patch makes the release
> path tolerant of it (skip klist_remove() when the device is not bound),
> while mine makes the deferred bind that usb_driver_claim_interface()
> promises actually complete when drivers_autoprobe is off, so the
> half-claimed state never arises.  If the direction is to remove the
> pre-assigned dev->driver users entirely via proper match() callbacks,
> I'm happy for that to supersede this fix -- I'd be glad to help with
> the USB side of that conversion, as I now know the claim/bind/teardown
> paths in detail.
> 
> Until such a conversion lands, though, the window is still open in
> current releases (syzbot hits it, and any userspace writing
> drivers_autoprobe races it), and pre-assignment is not only USB:
> drivers/w1/, drivers/phy/tegra/xusb.c and
> drivers/mailbox/zynqmp-ipi-mailbox.c pre-assign dev->driver the same
> way today.
> 
> So please treat this as: whichever of Kien's guard, this bind-side
> fix, or the match() conversion you want as the canonical answer, this
> patch is yours to drop or pick -- but happy to have your steer before
> it evolves further.

IMO, we do not want the system to limp along forever with the device in 
this "half-bound" state.  Claiming an interface should cause the driver 
core to create a real binding at some point in the near future.

This should happen even without automatic probing.  For example, if both 
interfaces are unbound and the user writes one of them to the driver's 
"bind" sysfs attribute, both interfaces should end up bound to the 
driver after only a short delay.

Alan Stern
