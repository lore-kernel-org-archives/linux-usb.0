Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DA247206B
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 17:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788195861; cv=pass; b=r2Mdv66m3zpOe7u/C0J3EdxTckfp67UDy7QETaxRqc0OZqo37qd1prujyvESzVzImkijrSuE3ACLOVtWzRP3Nn8hVMhxuuVYUvxnDIJjF6KYP+YYmtuLu+PHjR0cl9YX35kcEjuki88NpBIFrWz/9wfFdk5mxwhLVtF2toPyGPs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788195861; c=relaxed/simple;
	bh=VeIm/m6wK3h90PKRx14hlNC6hcs5cXsaRzlxDGhe2Xg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IByzLlu6N285wmIM0LAobpaE7lhqMK06OCVv9qV6h77jXg42Ya5D7FrN61JuMxjl1ryMAteSoZYVatzbn4LOJbqMM0o2gFWTJ+juR9rLFix2WDjP3q/dvlhR8wmVLtzcVtHoZlh7iKLpBLPRqOckexAURoAIRjFQg8IVbDiWTR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=I1YP6xV4; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="I1YP6xV4"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-66ce4a63e17so2823335d50.3
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 10:04:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788195859; cv=none;
        d=google.com; s=arc-20260327;
        b=Ew0M4HK79dL3wqk/0sSm9vtItM+yaucIHWJdRiWdgZI+sTNnuhOEur1WhG6SlsyQK3
         KjXGfvdL/CfYeX3lc2Mmtw6IfNhy4n9zeoN7ETnqD0apJor+msI3kzW5dy7LloIwCnK1
         wmCmiRfpGVNzcsrTwMN5ryqbAs0ztwjuTADziTNPDwZ+AFrE13hmdKeqkxC0IR5XyJeR
         TTWRP4OrjR05a6FPS3NdaizvVYZld/PNHMl87UGrM79HfkJx7SZwUbveuyoePMyrQGLR
         YSfcm20u/l6OSOgNFnttACR9aTNJy0v7ZQO1zE7BtWcOFLkpzlCjQ1jWmTAo1d+ZZDo4
         lwGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0pq4dDUvzt7RMgM0rpITo2CMpdbS4bwmTMx9QwHO8es=;
        fh=lFQoL8PqR0IoyStC2B4h0iDq6quH87fVWF6oUaTmvZQ=;
        b=nzcXlPLbVA9VlvpyzDBM994jXcKqPp7zLjNbPD3Lihd55L+RO1PoYUeAK2oQcCTVtV
         vljprm6oJs5mp06Fq122tqgQDTEb/TCU0P2E3EGCC0cLn+AI7U96BuZnVLrfA9CHPssU
         yXLGxZlTZY+IntzbiXK2HUNwqCmC3JoAlcg8hU9gWkwEQmER5qJjCf72Nx+3MYUL83fh
         tzJ2Zy+E9o6xz4H0C7XlSWWdKotPQwtdyTyaULEVNTJGxr17U0mgB8y8mI3zXgTMcEh0
         aulCRjyaRHJ70aTarOYjr6jwZFOY61nrqvfo1arR0yXfreE1E1PE7e+N2336y013NPFx
         FeGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1788195859; x=1788800659; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0pq4dDUvzt7RMgM0rpITo2CMpdbS4bwmTMx9QwHO8es=;
        b=I1YP6xV4U6qxteWKhCgose8iubH3bAkKbX7/2mdpGfnvHzQDC93razNAa4ebhg6v61
         lzVNdecNXCF9KA433PueNN3TNZUiFmHC7puJP6lhnm7ebL7zrN2BuSbkiopLp1CL0YrD
         bf9tTDVCB/9tlRcACqGobBlVSnQDe+w2F9fG3Xi21KyV0Xa1JvbAhXlVVHr+MhJdAtZp
         ZkqVwbWcpYP0N/uV3n2vNwNWqrbhebuZ1PmhTl9Hyx8IEfKgAwS8S/cdXO96qjQT/32x
         suSOhkVCCNg6uJdZ9B2zEivluzxWUbOX66Pe69FHGa+Bq8EV/gsM0nVUW0ihziFPcwGX
         Fp7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788195859; x=1788800659;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0pq4dDUvzt7RMgM0rpITo2CMpdbS4bwmTMx9QwHO8es=;
        b=rf0GYc+r1tUvnRZDkl8IDIWiCFhFNgNwqv+Q9PGlEFHBx1zT3ME/65qbAcvQdcHFKZ
         aRjZMabIF0H9GzOflP9zb8k5/wnyvxT0i5AG7uEgQg1Tcf+6U5erT0/RM8GFTr9VlObK
         foTVLSGGIf8NBTnPanT0gQebuPfkELYeWlgqIuc9EWZzyNvvAnReKPFpJ5i4F9gIPoyC
         VDh9KcKLhKhQ6ah61x2n82hIO5fMDowBgyFXM/zJTeXCj5Qju/A+vdPBa4H1p7sKCEpx
         QFJigoUFUcEeewDgGjt9eY1k+yGC+MgCXQtnazaPyIqgEpd6oBdQcatqduwXHGxOTRyy
         TV7Q==
X-Forwarded-Encrypted: i=1; AKwUvByHEe1ck2dRD/ckb2kl153buaNLqBSuqU0LLLeQJr5N+MoxVcHKxS9MhMoPcb71YGKwb6OHNAHe0kc=@vger.kernel.org
X-Gm-Message-State: AFuF++k4AuFBDpKuU8lzTmdXmbfNFmYKPgLGuFzNy2vB3hYbBx7o5hso
	qxIKe0JD99WlpRsxp809SzhDp6+dzA67TdbHYEqGO3ka1LipNeONfkTmOrMjbZ3XuDkXuVJXkw+
	BTpAccPonq08fYH+NvIVdBtc30ZpyZ7ZKWy3GgYti
X-Gm-Gg: AYBFou3JbqaKP3Ps/NKbNcliQh1UQidE9zr/aM16467LbWH+DiQLdxqI4bCDU2wV2Iv
	9VLWOzT76SgUkmcIidyp+cE3H2mNVZLmATrNZiR5MCc4Zl3sXdwZCRuP+LWbKis1VyJAa8roJ78
	NZ1uKILkClrj/sYe2kCUlFIE9fZSuFTQ9xkQcdWWZX/0p83xIff0J0csf7pmntt2PVQg40JLcbB
	eHm7oCZLpLkVVweHNSmyaCElCL5MFBZAD0Uh3l7dzSspDqL3RGq9gTUggCSROuHUsi1wL8N/W4W
	Z8+l7/wbVM17jxQhf+Ib/VXqj5JmIfizyqUQrC2Db+hLqDz6mvWKfkwVVtQckZc461N7mTpAlRO
	4Y3GUXF+1idx81VRpWWa4L9lAPh4CU0YWEXs=
X-Received: by 2002:a05:690e:118b:b0:66f:8797:4049 with SMTP id
 956f58d0204a3-66f8797417dmr773051d50.17.1788195857652; Mon, 31 Aug 2026
 10:04:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826163101.4168-1-mike@fireburn.co.uk> <20260826163101.4168-2-mike@fireburn.co.uk>
 <DKZ3UPVXL5C5.37DDI6DQKS3MS@kernel.org>
In-Reply-To: <DKZ3UPVXL5C5.37DDI6DQKS3MS@kernel.org>
From: Mike Lothian <mike@fireburn.co.uk>
Date: Mon, 31 Aug 2026 18:04:05 +0100
X-Gm-Features: AcwNN1XxcyYJm1eBwRWa78c6Pv6t6O5HEJXmbaliVctDsN19FsugaMX_VtVZTog
Message-ID: <CAHbf0-EzHGuQ720V1g84U8Ys8HS+Lpdfdu22zZmB42G8yU=dqQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] rust: usb: add revocable typed interface I/O
To: dakr@kernel.org, linux-usb@vger.kernel.org
Cc: ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, daniel.almeida@collabora.com, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, 
	gregkh@linuxfoundation.org, colinbrauncl@gmail.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Aug 2026, Danilo Krummrich wrote:
> > + /// Asks the driver core to unbind whatever driver is currently bound to this interface.
>
> What is this needed for? Where do you use it?

Nothing in this posting uses it. It's a leftover from something I
removed, and I'm not sure it should have stayed removed.

It backed a write-only sysfs file, /sys/devices/vino/remove_all, which
walked the driver's list of held interfaces and called
device_release_driver() on each. evdi has had the same file since 2015
as /sys/devices/evdi/remove_all, so it's a name people with DisplayLink
hardware already know.

I added it because unloading the module used to be unsafe. disconnect()
could deadlock against usb_hub_wq, DRM references were held past unbind
so every replug leaked a card minor, and one unload took the machine
down. Having one write that unbound everything from process context,
with each disconnect running somewhere I could watch it, made those a
lot easier to find.

They're all fixed now, modprobe -r is reliable, and the sysfs file got
cut from the series along with the rest of the development scaffolding.
The binding method survived the cut without its caller.

I'll drop it for v4 either way. The bit I'd like your opinion on is
whether it should come back later with the user attached. Against:
/sys/bus/usb/drivers/vino/unbind already does this, and all remove_all
saves you is knowing which interfaces the driver kept. For: a dock is
the kind of device where someone wants to hand the hardware back without
knowing that, and evdi has shipped the file for ten years.

> > +/// A revocable window during which USB I/O is permitted on an interface.
>
> How is this different or narrower than the device's Bound type state
> represents?

There's one way it's narrower, and that's why I wrote it. The USB core
forbids I/O between suspend() and resume(), and between pre_reset()
and post_reset(), and the interface stays bound across all four. So a
driver holding proof of Bound can be holding it when a transfer isn't
legal. Bound means the driver owns the interface; the window means the
core will currently carry a transfer.

> Also, this seems to reinvent Devres, which we superseded with Rust
> native lifetimes and higher-ranked types. Please use that instead.

The open/closed flag and the wait-for-quiescence are hand-rolled, and
they shouldn't be.

What I don't know is whether the lifetime and higher-ranked machinery
can express a window that closes and then reopens, several times, within
one bind. That's what suspend/resume and pre_reset/post_reset need, and
revocation as I understand it is one-way.

If it can, I'll respin on top of it. If it can't, then I think this
guarantee is USB-specific and belongs behind a USB type rather than a
general one. I'd rather know which before I rewrite it.

Thanks,
Mike


On Wed, 26 Aug 2026 at 19:59, Danilo Krummrich <dakr@kernel.org> wrote:
>
> On Wed Aug 26, 2026 at 6:30 PM CEST, Mike Lothian wrote:
> > +    /// Asks the driver core to unbind whatever driver is currently bound to this interface.
>
> What is this needed for? Where do you use it?
>
> > +    /// This is the narrow, reviewed replacement for handing out a raw `struct device` pointer: it
> > +    /// performs exactly one operation (`device_release_driver()`) on this interface's own device,
> > +    /// and cannot be used to reach the device-wide state of a composite peer.
> > +    ///
> > +    /// It is intended for a driver-provided "release my devices" control (e.g. a sysfs attribute),
> > +    /// and must not be called from the driver's own `probe()` or `disconnect()` callback: the
> > +    /// driver core already holds the device lock across those.
>
> IOW, it must not be available for Interface<Core>, which due to the deref chain
> is not that trivial to model. So, if this is really needed I think this needs a
> an abstraction where you get a different device newtype from the scope where
> this *should* be called from that allows you to do this and can never leave the
> scope.
>
> > +    pub fn release_driver(&self) {
> > +        // SAFETY: `self.as_raw()` is a valid `struct usb_interface` by the type invariant, so the
> > +        // address of its embedded `dev` is a valid `struct device`. `device_release_driver()`
> > +        // takes the device lock itself and tolerates a device with no driver bound.
> > +        unsafe { bindings::device_release_driver(&raw mut (*self.as_raw()).dev) };
> > +    }
>
> [...]
>
> > +/// A revocable window during which USB I/O is permitted on an interface.
> > +///
> > +/// A driver-`Bound` interface is *not* on its own proof that a transfer may be issued: the USB
> > +/// core forbids I/O outside the window that opens after a successful `probe()`/resume/reset-resume
> > +/// and must be closed again before `disconnect()`, `suspend()` or `pre_reset()` returns. This type
> > +/// represents exactly that narrower state.
>
> How is this different or narrower than the device's Bound type state represents?
> Also, this seems to reinvent Devres, which we superseded with Rust native
> lifetimes and higher-ranked types. Please use that instead.
