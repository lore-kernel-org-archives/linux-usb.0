Received: from mta-511b.oxsus-vadesecure.net (mta-511b.oxsus-vadesecure.net [173.45.18.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BB12E1F0E
	for <linux-usb@vger.kernel.org>; Tue,  7 Jul 2026 05:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.45.18.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783402396; cv=none; b=aCxo2foJ2U1v4dbutakZAx9rxbuZvfYPPrrIDGei7DN+d/4fzdxtZoTstPvRqKcOD0tNj+dLa7JVEoiNdQQzTr1VTyJaYFE5fFwYLjv2ckSa7tvyArVu+QAN8zESP4/zSWpuaacHkjkHyu2aOQM7NC4I+FRY0lJzk9lnaLf+4a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783402396; c=relaxed/simple;
	bh=l10NxqZB5BxFE5b8Uoaug+vvn+8xvush8ZKhY4NPJgA=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=Kc1/GPWr5DNfekQqaNhJfdfAXuFIZSOxgpcwf6W2kyTqT7e1Z1+gjejO/u/lXdqwczH6cxzCI4XE8O0fuoCi99OsaG0T6bZWpjNSrkscuoAaPTReNEzYpsNTBq7Wg134YS/lqRZq+Ma6SUPZDTWwCnqKluD7Ob02Mm2lSqpNOYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=synergy.org; spf=pass smtp.mailfrom=synergy.org; dkim=pass (2048-bit key) header.d=oxsus-vadesecure.net header.i=@oxsus-vadesecure.net header.b=BuKjuRPu; arc=none smtp.client-ip=173.45.18.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=synergy.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synergy.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oxsus-vadesecure.net header.i=@oxsus-vadesecure.net header.b="BuKjuRPu"
Authentication-Results: oxsus-vadesecure.net;
 auth=pass smtp.auth=4@316323 smtp.mailfrom=dave@synergy.org;
DKIM-Signature: v=1; a=rsa-sha256; bh=kZkY1mXHgzCI+gp8Uj3Qbr2gT8HX7tLmQZIxY9
 nDgUE=; c=relaxed/relaxed; d=oxsus-vadesecure.net; h=from:reply-to:
 subject:date:to:cc:resent-date:resent-from:resent-to:resent-cc:
 in-reply-to:references:list-id:list-help:list-unsubscribe:
 list-unsubscribe-post:list-subscribe:list-post:list-owner:list-archive;
 q=dns/txt; s=dkim-202410-rsa2048; t=1783401478; x=1784006278; b=BuKjuRP
 u1kqTdUDJWYp1KtrNY4GHdIglPoL7CSWNDZavrrmbiphddlYjIgxyVGPDqoQ3Lb8kK8+wSf
 XljJGf4Wa3CvuhmqVV6zL4WnaMyNvUVS07qBrNszcqbufbcaiL3DsEkfLWWSj8r3g8hpWu3
 nH2NHr2Auhw/2YmvyHdMom2JJjKukKvdO3wr6BdpjlYJHvWxEF9LfcZdHvZh2Z3opO7DEZQ
 jBYkHmjzOJgATOZOAgt2dRXGqezrIO/d6roCtKC3xs/KLx6gBuHmhqcv9zWdNSpQ+MceKS2
 bKAHiVB2SyuA+5LE0CFEwZ/F/u2FkqCqe0n6da+LeOFQce0D+7Q==
Received: from proxy-4 ([174.165.77.67])
 by oxsus5nmtao01p.internal.vadesecure.com with ngmta
 id 5ddea55e-18bfea31ebe71e1d; Tue, 07 Jul 2026 05:17:58 +0000
From: <dave@synergy.org>
To: "'Greg KH'" <greg@kroah.com>
Cc: <linux-usb@vger.kernel.org>
References: <002001dd0dbd$d4269020$7c73b060$@synergy.org> <2026070759-research-undefined-aa1f@gregkh>
In-Reply-To: <2026070759-research-undefined-aa1f@gregkh>
Subject: RE: USB Keypad
Date: Mon, 6 Jul 2026 22:17:54 -0700
Message-ID: <000201dd0dcf$f8759630$e960c290$@synergy.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIdvAZ/onwCGw1Z3iD8odwQD1VDjAH3rPdotdBpRBA=
Content-Language: en-us

Greg,
	Wisdom, indeed. I just disconnected the keypad from the Pi and
connected it to my Windows laptop. When I brought up an editor I was able to
demonstrate exactly the same mappings. No, it is not the kernel. This
appears to be the device, itself. Thank you for the debug suggestion. I
should have thought of it.
	Thanks,
	David



-----Original Message-----
From: Greg KH <greg@kroah.com> 
Sent: Monday, July 6, 2026 9:30 PM
To: dave@synergy.org
Cc: linux-usb@vger.kernel.org
Subject: Re: USB Keypad

On Mon, Jul 06, 2026 at 08:08:01PM -0700, dave@synergy.org wrote:
> Excuse me. I have never sent e-mail to the Linux Kernel mailing list
before.
> In reading the protocol, I think I should have sent my message to this 
> one, instead.
> 
> Hello,
> 	I am working on a mobile device based on Raspberry Pi OS. I am using

> a USB keypad to navigate the UI of my device. I have purchased 2 
> models. One has 19 keys and the other has a few more. I've implemented 
> the user-space code to read() the input device. Things are generally 
> working fine. But I have one issue. On both models the keycodes I 
> receive are not unique across all keys. On one, the key labeled INS 
> and the one labeled 0 both send the same code.

That sounds like a broken device, not much the kernel can do about that.

Can you confirm this by looking at the keycodes when plugging the device
into any other "normal" Linux system?

> On the second one, the mapping is even more bizarre. It has duplicated 
> Num Locks and other keys, as well. The number keys are always readable 
> as such, but the other non-number keys can be aliased.

Again, is this keyboard issue?  Do they work properly anywhere else?

thanks,

greg k-h

