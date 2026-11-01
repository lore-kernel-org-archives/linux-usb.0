Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793521779;
	b=yqRL6Nh2Uxu2Rp+Cfn5yxhMYfbsSwsrYs7BpCAtWEKxcVbZOyQJObk1XdbBMOIRVeSR9
	 pK1XhVwitv/xhWM/PupOMzK28p33RGcyytKfw3CH3DnqNrMg8MQdN5t8FZCWwEm0zJOUa
	 eCEXwybXwJgiVhbCAOKAsPzXSDjt9/Uv+2Nvq8+1+uwnCOAmaJusZukplhOsC3lwCPx3O
	 RY5ObJvvaw4ogYMPSNMQjvwwU7t84X1dNTpKXHKqOIckxxo5gMzKhLm0u3SU7DoVBgQ5L
	 TV2nnc2qPHathbsc0sjjF2El9oHRj7tRolZD5LuMtOKjHnl3NJqgMaKI8u2hPKJAKcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793521779;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=CrY4G42DWgUQkrodiQ6Nsohi3rTiSwswU6zN9JB0NB0=;
	b=PDcAeYG/HWfbaYE1+u/VNA54SCNLRJODtq6CguWi6zpjQxqSi+ogzAIe0DuTfck9tRdE
	 BdyELZ76kSvtableNIfIaRF0QgWMzfGBKa0qCq2TK7yeZdSP62hjHcMmrQ6NN8eyPudQH
	 0xWGbdQxOytQDrj5sYvUs7MW3FG2EIMmJqjUyX79a7azZLE1YRDpefsfl4Ye4XpaJZfsy
	 AJ41/z86wVrxYuRbEeM1J6cw7hgWOAYI4bDP44FJkPIvR8b2OWRErWwQkpKBhwrWN+W9i
	 m1rDW3vP1y24lN7hKNINUKS6p9Ma7FxSZet/Gv2clt36yd7iDgySde0+bxCTdCpGoqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RQUWpKmp;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EEFD606A32C
	for <linux-usb@vger.kernel.org>; Sun,  1 Nov 2026 08:29:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EEFD606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RQUWpKmp
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48c4649b35bso1919219f8f.3
        for <linux-usb@vger.kernel.org>; Sun, 01 Nov 2026 01:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793521778; x=1794126578; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CrY4G42DWgUQkrodiQ6Nsohi3rTiSwswU6zN9JB0NB0=;
        b=RQUWpKmpXmZ1fGB2zb3SpPpHCYDLA3+OOXlM6F0jCFH74B6HvVG+vO3UsQZYPHmrvt
         LUI7Y/vGtQ9M1mQmdmh560LnX84J9ycTnXzZaK0Ntx0kTdBQwIcTOqKg2AflPBnDGmDG
         QXEROAuVvVlS/UeXkp1/PNcWjZruPwLLnkPSyKmSXIJ6Bp6jFoBi++dLd4deU1oWm+6f
         yBx9e6yNcNcMzC11gKswxWmbfNaPgdH/0AGe5wunLQd7f1GNO0ZvJgOCFjZ3KameBPMi
         4MIe2H4PNNzEsVDjUO0E7QvhuBoH832OiiBNEgH333UOO0noFUwGiVU/wgxi2ySHZlt/
         u5qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793521778; x=1794126578;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CrY4G42DWgUQkrodiQ6Nsohi3rTiSwswU6zN9JB0NB0=;
        b=cPrVsXdqTjHUw++MJGtsFd93gJHXBTEwhXAgqcviVkdIkb9jQVsXaCDfP+0Yjy7PcO
         YwML47UctnoQHnDh7fxl3tIQtG1S3Zr686tUA3DuVMK1K4lk4M6Vj1VVpPkjfYHqsplN
         Ir0FhWSrE/B7Z/fD9XSt6ucg3BwCok1HKwogsYeIGSo/8SyTOnt3wAa58IKjZxaXgYEG
         esMHxFK9cIa/nbmmWKq8oOspreAiNcn6a8KmK7LmfTAscH3vQx3SLq4dxsWwwinG461h
         sThl8DlGYuNnSNQwdh/Mt/jVL/reVXotyZYKRTAvS6KtXcnS3ZhA/5vpOzdcU8kjxNwt
         UAPw==
X-Forwarded-Encrypted: i=1; AKwUvBxRsnB31e9Gw6YurtJk3wNNFPbuGP+ZW9gWv8C7ap1iDCIztPv9i5J7TP3zcQ7hxueUxIAEZ2s4VPU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kEmLHapIA+O0e8Vjv4GZaDe1lOLEKDR17byPZALPhIRin40gH
	v9pndCubhdKtZhw2pjManqjHRuerB1cb3PxyjzR6lKaV2BdHGjs3uopE
X-Gm-Gg: AYBFou3MjTI+n9d/MfQMZYHRigUSt6dfkPL8Gsq7je39t1Wc3ocSkswKHkvuoT+35Pq
	RKTdER33SIM/51apvGoWb6L3rcMCyQ8ocAMj8D5QF0TKFrzLLHLvEjdexqgpDcAMDB7CsNZMo5z
	a2EZU5kC1LOwUWxbx9eUoiTs6MhGnV8/51bxHs5/JK8Uf9EC2XLSVlaHXncu2rWWpUiTlcNhc0q
	hV3XqXua9Bu4WpJ6iy2e/vSAOdIMq+Zs/ICRoIOMl17W+4QN4X358sb1ptnf36DIVCg8KwA+UjS
	QHuUCxAcbSwTksgFNuHcgV661tuy4BsuNpL+pWlhVtbfHkB0sRLaEmi1/Owd0XapkUlg9trm+Oe
	z1HoDHO6jxX3dri1VR42gmU8YcmqaehJngGRO4CCvxxh3qFXNEsRvj+y7LQmC7iLCw2LyDCAyZM
	m9rsLFa9m6bS6r65vT+7h/bE4fjTC2I8cEzr14Eb66watRqCgZqYys06/H7Zd96MlKPuJAUGl5d
	g/nrFRmXF2djDWl3t7K2B7D+MurdUvXUVshDIZgWZlIAuasYFDySniZQHhaaBwlblFpLePHxwQa
	mUk5rNVcknkJHSGF0I33p/+A1vd4BbrJ2PO6
X-Received: by 2002:a05:6000:46c3:b0:48e:4a8a:e17f with SMTP id ffacd0b85a97d-48e6e2bc7f2mr10289635f8f.4.1793521777564;
        Sun, 01 Nov 2026 01:29:37 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba2415sm13345902f8f.50.2026.11.01.01.29.34
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 01 Nov 2026 01:29:36 -0700 (PDT)
Date: Sun, 1 Nov 2026 09:29:30 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Dennis Wissel
 <dennis@dsine.de>, Yiyu Zhou <yiyu@yiyuzhou.io>, linux-usb@vger.kernel.org,
 regressions@lists.linux.dev
Subject: Re: [REGRESSION] usbhid -110 timeouts and reset loop for Keychron
 M5 (3434:d068) at boot since v7.3
Message-ID: <20261101092930.114ca454.michal.pecio@gmail.com>
In-Reply-To: <387e9e3b-683e-474c-ba00-4b12c7c77b7c@rowland.harvard.edu>
References: <4MjB9K-2SoiA85WbI9iEig@dsine.de>
	<20261024203558.3181711-1-yiyu@yiyuzhou.io>
	<SrQQcLIwRWyg9PdEIpc0eg@dsine.de>
	<20261025111410.2c14fcef.michal.pecio@gmail.com>
	<7082e2e7-8d05-46b8-a26b-5b888a7a0545@linux.intel.com>
	<20261026105139.6b86cb3c.michal.pecio@gmail.com>
	<3ddd9334-6dee-48cf-8a62-82cebbe51d7f@rowland.harvard.edu>
	<20261030174718.1f28218a.michal.pecio@gmail.com>
	<387e9e3b-683e-474c-ba00-4b12c7c77b7c@rowland.harvard.edu>
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

On Sat, 31 Oct 2026 12:32:38 -0400, Alan Stern wrote:
> The USB-Persist stuff in the hub driver was originally motivated by the 
> desire to recover from disconnections during system suspend.  For 
> example, disconnections caused by host controllers that don't provide 
> Vbus power while they are suspended, or users unplugging a device while 
> the system is suspended and then plugging it back in before the system 
> resumes.  A more detailed description, somewhat out of date by now, is 
> given in the changelog for 8808f00c7adf ("USB: try to salvage lost power 
> sessions").
> 
> Yes, this feature is very important.  Mostly it was meant for USB 
> mass-storage devices going away and then reappearing following a system 
> resume.  Before the USB-Persist facility was added, if the device held a 
> mounted filesystem the result would _not_ be what users desired, to put 
> it mildly.  The ability to handle transient disconnections was just an 
> unintended side benefit, although there did seem to be some real cases 
> where it helped -- USB mice or something like that.
> 
> To the device and driver, what happens looks like a reset, or rather, a 
> reset-resume because the former configuration and altsettings are 
> restored.  Naturally any ongoing operations would be expected to be cut 
> short, but while the device is suspended this isn't an issue.
> 
> It seems that you're concerned about two slightly different types of 
> thing.  In one, the disconnection happens while the device is suspended 
> and it is discovered when we want to resume the device.  Presumably 
> that's not a problem for you (?), because in this case we really do go 
> through the whole reset-resume procedure.

Suspend and USB-Persist is a thing to keep in mind to avoid breaking,
but intended behavior change is only to drivers with URBs pending or
submitted on a disconnected device. We would like to reject such URBs
on devices behind disconnected root hub ports.

Maybe I will just say what I'm looking for to avoid XY problems: we
need a "barrier" which separates URBs (and ideally state changes like
deconfiguration) related to the pre-disconnection state from those
related to the post-reconnection state, when a udev is "rescued" and
the HCD must accept URBs to it again.

A suspended device has no URBs, so the barrier only needs to be one-
sided. I guess root hub port reset or hcd->driver->reset_device() on
the device or any of its upstream hubs is good enough

(Current logic in 7.3 watches for individual reset_device() calls
or RH port reconnection; the latter is clearly less than ideal for
USB3, and Sashiko thinks there are other issues.)

> When a hub is reset, the logic for what happens to its children is a 
> little tricky to follow. I think that each port with a connected
> child ends up being handled by hub_port_connect_change(), which
> treats it as a new connection _unless_ the child was suspended
> beforehand, in which case we follow the reset-resume path. So yes,
> it is possible for the child will be reused in this way.

Hmm, what about hub_pre_reset()? It seems to usb_disconnect() all
children when it runs. I would expect even a suspended child to be
permanently forgotten before the hub is reset.

Unless the hub itself was suspended and gets reset-resumed instead,
I suppose. But then everything is quiescent so no problem.

If core can promise that children are suspended or already deleted
when a hub gets reset, we could use hub reset as one barrier for the
hub and all children, without tracking this per-device.

I implemented this barrier logic and it seems to work as expected,
and ftrace shows that hub_pre_reset() runs and drops children. But
it works != it always works != it will stay working...

> But even when the children aren't reused, unless their 
> udev->persist_enabled flag is clear, they don't go away until well
> after the hub has been reset.  The reason is that the hub driver has
> to look at each one, after the hub is running again, and evaluate
> whether the connection can be recovered.  Maybe this can be improved.

That sounds like suspend and reset-resume of the hub. Considering
hub_pre_reset(), it hopefully doesn't happen on awake hubs.

> The case you mentioned, about a reset being queued but not occurring 
> until after a transient disconnection, is a little different from the 
> other cases.  The core basically ignores disconnections while a reset
> is in progress (in USB-2, the electrical signalling used during a
> reset actually makes it impossible for the upstream port to tell
> whether the device remains connected or not). Disconnections before
> a reset starts end up getting handled much the same way; the most
> that happens is that the connect-change status is cleared and the
> reset is retried.
>
> This was all implemented before USB-3 appeared.  If we were to do it 
> again now, we might do it differently.

Thanks, good to know. It is maybe not a big deal to maintain this
"resuscitation" of awake devices. It seems similar to recovery from
USB3 SS.Inactive state - logical link error without disconnection,
software may try to Warm Reset the device. (I don't have any repro
and don't know if it's handled here).

Regards,
Michal
