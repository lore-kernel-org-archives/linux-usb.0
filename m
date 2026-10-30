Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793388434;
	b=bSe7d2PsZuP/a2X5xD6NkzdoIdVR7587/iQCcBT4dxRUdrl/xWrbxcxicltXbjwCOip7
	 meYJCqRnX4xaLcn3RdIJ+0P1T9jzO0djjg5q1k1oiyWAYQD+3wZPgSeo2ZATxpic5S8ME
	 DEExU6x3oy5tomwueLQdZkZOI/m7RWNhu7HLKWhwZ+ItgTMQnnGu6mvMmToYKa9c7zUnm
	 1le2IdONy0Fm72KBE75zUhp98aEG9ksVhRCTJGje1xyBLs+hK6Crl47agX6ake8IBsPwx
	 QDHe1Ij8RGRKxEopCr13VLF9tnk7sf3ZK3TWE4jFxy9yvrIyETJmG9DhQPxYV9rYitA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793388434;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=W3eqtySLpsSRrLHxnJHA1+br5XulPGqh1IskE7kkJD4=;
	b=r2v6pxLnZbk5s3QSRVDtHF10UVxL8p8wpTZv7zs2o+sFVW5XaLP03gbkK5mM8n1RhhQ5
	 3GUn/998p8eic7qYpGDiF9COyUTmYK/EjROps0twDER7PwlGykzR3Opy/X607TOw8KzcD
	 43R6OpjYhTSQSz8SboJSS18lVRJih1CngFCHoIT1w4g8w+NzPxtHI1WSxehoy3fbjR55W
	 t8+yb6sdZqScaUlmKq0uliP5i2rnlTr1rNIkkl1W1O8OAWrb+ZrHy/aS9YSRnI/zKaaYf
	 XTx6sRZtBifY+oxbF+Xqn+QhrxIEU3hYRBKjGs7juwBnUuGNF45AoaF0ixSoKcg0zNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CggEzvOK;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC20D606A31A
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 19:27:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC20D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CggEzvOK
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so14383975e9.1
        for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 12:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793388432; x=1793993232; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W3eqtySLpsSRrLHxnJHA1+br5XulPGqh1IskE7kkJD4=;
        b=CggEzvOKFa1L3ga9AJV8RrdGAUkkK+P7Lzx3tijgksaFw7Mr1dszfHoociyCezrXYd
         MAawsze0Z855p7yyW1pKYwfPLJB3eEnLS73/5Hd2D0J24ZdN5yGKLdw5Ie3S0w/hzd01
         F5R1TSJzwFAXN/io1/oSOZSFrPtXA9zupWVLhG+n0W8yBjrSe7QRNEW6gVl2/9MPmx/i
         o1cAj+VObqozzFLOvVV4Qx0LcbLHOWhXCeyyB2yGG8paxmjOnhzGeQcs2BlfUhpgqmYl
         TXMXe5SnzyrFWBuUt/30AdQvdoDIfH5y65VbbvI5BmDLVi69p5dHHB3zRqFJEGPbeLHq
         j/yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793388432; x=1793993232;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W3eqtySLpsSRrLHxnJHA1+br5XulPGqh1IskE7kkJD4=;
        b=25CkNPCII2ccWqf2w9oKqeWSDWGi/V5D5C7mWTzcWWgkhuhnZPFngzTu01hxawiF3r
         9U/ViA7/2InX5DmvSWIDF8egFP688UKQn0k/QSaHIhPBHP3UttMw0O6HQCscZ+aKwEG1
         rZBrZaXN6+9/mbmnwUMi9T3ln4HcbT9cgJ0Udi5mN/QQuHjPlwW83VbMcG8CjW00aAE3
         V/6+eKv4AnhY0beDXIhFYgycvu4S2wjOkTa+Mjw6wPYyQTnGIWEZYmSJr0EiTQJkbmi/
         Nk+NpOiFNrM+u82DwDOdS6qr4pbsyDojkfEgEkTiqd/q2I3p0QVn/T0KXOvrjOe2QTRo
         R+NQ==
X-Forwarded-Encrypted: i=1; AKwUvBzddacyvLrfvXNdY6FMv0SW4jokuxyB82zjrhBE9kpSxYHPqJXES1lyQNJXnEmeAl7WTATbV2meNSI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwiA6yKtbbWoVBkpS3lQmU19z6TlvW85+UKpH6Snzay6DplrKk
	Rwo31y6E0ZISKgna+eIpRgnRTjLuIGD3580IMxyBi5HQQRY1zkZOL/WO
X-Gm-Gg: AYBFou3i1zR+Omk8Byk5878z72IKth+tNF/wRlZkSkMUXZBeuD5Fsf2cb4mJg5rJ9W4
	Lq7iuqj8dfUtAcaLot7Ux/pxLt/DvT0Jp+4LnHWGgPgaAhVA085RFt+pb7P0Mj4ewAQwPCVGUd1
	bVnQaoSv2H7Hm47P3uNxwYyL5zDKe0cHdBVNjKPc5bHa6QT6OLmXJCO4iTmgMisT3vVPWpH/58O
	sapxMFAjztAfIELkgd/5N8znWrtn/nKaKpNnoc8wHaU5dSFxjUaOSDh5W7bAa3PB0hAyBJBCaJa
	b9SsiRiXaDySe6WERnPzXW8NWZHZ/hWdgPsc56gyrAvAgJs9qoPprLQI+YGB6leoqgwq3HK1Npb
	wvjFeEbUePAT5fZWIvkqZhO5IruZ/t2X6WJrTXv28Gnz5+uLTi1YqccDbVbPFLKtJreflTnn90P
	mgmGhkqEVTYiXj32Oa7g79BSewnZjirzzXZ4CCp5NUGt+2K2nJZ26ly/hkZ7QkXBwyXq0Npf7U8
	/q3gJ/62SIvVrWTDBdoEqVt69nAtIwqE5PJgZW+BnH7CAP64mK3fjuJ9TndhKWOjEpuzbTup/5b
	gTrrILQBKGvzoEFkU9HoUFej9BkBJMPtXiukGsBI9/WOurll6rR1x7Ytpsc=
X-Received: by 2002:a05:600c:848c:b0:4a3:5da2:38ae with SMTP id 5b1f17b1804b1-4ac17a3628emr76096785e9.14.1793388432009;
        Fri, 30 Oct 2026 12:27:12 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723bfsm4623213f8f.15.2026.10.30.12.27.11
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 30 Oct 2026 12:27:11 -0700 (PDT)
Date: Fri, 30 Oct 2026 20:27:07 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 regressions@lists.linux.dev, Yiyu Zhou <yiyu@yiyuzhou.io>, Dennis Wissel
 <dennis@dsine.de>
Subject: Re: [PATCH v2] xhci: give back TDs and clean up ep0 after
 disconnect
Message-ID: <20261030202707.6dde12d2.michal.pecio@gmail.com>
In-Reply-To: <35b20a70-f1b8-4e86-9fb4-35877b63d6fd@linux.intel.com>
References: <20261029204324.658845-1-mathias.nyman@linux.intel.com>
	<20261029204324.658845-2-mathias.nyman@linux.intel.com>
	<2026103009-handful-labored-d1ce@gregkh>
	<f362a385-e1d6-437c-a31c-fbf4414fa0f5@linux.intel.com>
	<20261030130532.36a75025.michal.pecio@gmail.com>
	<35b20a70-f1b8-4e86-9fb4-35877b63d6fd@linux.intel.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 30 Oct 2026 18:57:14 +0200, Mathias Nyman wrote:
> > If USB3 link comes back after core has cleared all status change
> > bits (brief disconnection), we will get another Port Status Change
> > Event, observe the port in "Connected/U0" state and reset these
> > flags.  
> 
> This is what we want.
> These flags are tracking root port states, not trying to track usb
> device states

Fair enough.

> > Is it guaranteed that core won't clear change bits until it finishes
> > disconnection of affected devices so that all URBs are unlinked and
> > we can no longer run into those HW bugs anymore?  
> 
> No, and that is not the goal.
> We are trying to avoid excessive endpoint state mangling after devices
> are disconnected.

The problem is: we need to detect those disconnections, and we rely
on aforementioned port state flags.

We only detect disconnection if an endpoint halts while the flag is
set. If the same endpoint halts a few ms later, and link is already
restored, the flag is cleared and we don't detect disconnection.
Many interrupt endpoints have long intervals and halt with a delay.

There is risk that the disconnection has caused permanent change in
HC state and some endpoints need those workarounds even if link is
restored, though the only documented case so far seems to be Henry
Tseng's Configure Endpoint bug.

> > If this fails to work, it's another regression vs 7.2 and prior. The
> > old VDEV_PORT_ERROR flag used to stick for device lifetime. And it
> > could have been extended to all disconnected devices, not just the
> > one directly attached to the root port, to fix disconnection of
> > whole trees with hubs while avoiding the above race condition.  
> 
> moving the flags to all child vdev devices won't help, you
> have all the same issues, plus the fact that vdevs are sometines
> reallocated mid enumeration and sometimes will stick even if device
> briefly disconnects mid enumeration, just like ep0.

If vdev reallocation implies that the slot is disablend and enabled
again, then any bad state goes away together with VDEV_PORT_ERROR.

If a slot survives a brief disconnect, I suppose we are hitting the
"resuscitation" case, so we should get a reset_device() call and
then clear VDEV_PORT_ERROR.

> > The reported USB2 regressions would have also been avoided, because
> > old code only applied to USB3 ports and there is no actual need to
> > generalize it to USB2 at this time. The bug still affected USB3, but
> > it seems nobody uses USB3 devices that trigger it.  
> 
> It's more about the hosts than the devices.
> [...]

Yes. But until 7.3, workarounds for disconnected devices were limited
to USB3 and nobody complained. The new Renesas disconnection bug seems
limited to USB3 devices too. So if this code continues to cause issues
with USB2 devices, restricting it to USB3 could be an option.

> > I suppose I could fix the Renesas disconnection issue which the 7.3
> > rework tried to address with an alternative patch smaller than this
> > fixup, provided that the whole series is reverted. The preexisting
> > USB3 bug would remain unsolved for now, however.  
> 
> Doesn't make sense to start from scratch because of this sashiko
> report. You'll just run into a new set of issues and regressions.

The point would be to buy time and see what's the bare minimum of
functional change to avoid bugs that are confirmed to exist.

But I start to see that if it turns out that all the functionality
implemented in 7.3 and the fixup patch is impossible to avoid, then
the code would end up similar in the end.

The biggest saving probably came from "cheating" and relying on
drivers unlinking their URBs in disconnect().

Regards,
Michal
