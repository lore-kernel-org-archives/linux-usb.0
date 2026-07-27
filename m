Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E623CFF73
	for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2026 19:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785180553; cv=pass; b=g8J8NBNSoaPxW/aQFlNN9Yh8PVNW4LkNCdkKbkTh9zT4Wg9E5GWyTrnpbJP7Ztsvnt3H9ix8Lqs2uqlQKONxrYNG4vWRbTUUEg4AldUjbj6BSX+JJvu9o7voynm1fPvBrlkCUhe9a3tKh+HRiTzuXb3BPbUK6ztgCyluUbHWLRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785180553; c=relaxed/simple;
	bh=l5UANCWKQnUSOdH40v1sMZ5J3N2x8k2rHX33wan+gGk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TzRtV3i/8CCjEwei6qQ/iEo43JsBPZz8lzDKORsl4w8xgjjLylTGNnMfdMoxywnCjAUEWkrRICAdhSytkb+ADeWH92WHouDpTZg+misr4Vw6Hrn3mWFNAzgi201FRi/r89lWLNDahJatRIlNTEBz97gBo5KoPxujxFUEuym4a8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d4QbsQyr; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d4QbsQyr"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-69c600f76ccso4199957a12.0
        for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2026 12:29:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785180551; cv=none;
        d=google.com; s=arc-20260327;
        b=pQXnAio3b2SoeuMRd06L0Vq0rJHaCpLbLP1ZyqIVmmZhoEstdu3e3rHAd8Q3rbvWOQ
         J6dGTGpylNNnGGIVBUPeZKt7Km4hRn1qvTiU1mGKT8JKuW4Uaf11MYWOvrdP+gfo5903
         5aubZV1z4A1F4LJS5Kn5zf2cqT8wZxIyg45KKsFcvkTcdrnDlfGq7gqCLWZFDPmDn4Yy
         FQCelp1FzGYZgJ9xApuiV0mfV+72ZfL4OLOGjDeYKbPIVEYtIaElxgwFLvah+RM0JPiO
         FqJraCOnEoi1kh/sFeHZZ51aNvfm1irmc1/dpWt0P61+0xOnErXBnxc0lpfulgUXHGeB
         wGwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=E1XtUv13j1bmIF/Zt1j12HfipLjGtWIMJhlzMR1QV2c=;
        fh=LqaL4jKMNhhq0IVbkMObhbYMcvd3sBWwzCsjifKpuOU=;
        b=d780tZEeCeLmf4pjzo/2xMmxsBgUim5ycUAruY0VXZJk/p5ekat7sIsmhL2KKowToL
         SU9/4hNWFHjL5N7NuknFRNsQV5hrrP51ACC4uBauEdOmKynBZxAFkh/AZNKSZYOkUUWY
         uixzodhWxng/hf4DbvlYFG9yPby+/MhOvWMYjE/2GUpCbzgwfyuIyWi5V9LPLH0IxYs7
         TmzaAtPKJFNi+TUITba+2UAJSxW54lZJzntRgopWA1+UTC04IZcxNZ9wS4Kv6DAKcN3Z
         S8W1dgCAwOEyK6oj1JNppLtcreZkbqBSnJsKIMZUY2flc7jp5vJtToa2eGWUblQpWPpW
         zz3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785180551; x=1785785351; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E1XtUv13j1bmIF/Zt1j12HfipLjGtWIMJhlzMR1QV2c=;
        b=d4QbsQyrdqNxn0KzXnYEBHtye1MowR9hmQNNB1VKuAz08vanS9WTqXR6M8+soRzJBo
         b9QRY2l3g5zV/eS5rrljcq2yzvQbaV88WlJs0pvTlfHuCERYmxucCmrKt5u/UpTP5UhG
         vKRlDijQJ92uwGSXuH9kN0Lk569pcNnesmp9H7+G1b14k9sLgVPurVcyY/u38UPfELNk
         MSeLYTrWcJ2QszT0L8FF4rHhBALIt0900EJ2TDS9HCFEyIfzakSE4hlQjc4NE1yT0bom
         oHY6aLE90yESmT2CNeRWoLBeylPL6H2J3h7GJhbNM/o2NkQ6ejOgKf7UuOmvwdvT3reD
         UDCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785180551; x=1785785351;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E1XtUv13j1bmIF/Zt1j12HfipLjGtWIMJhlzMR1QV2c=;
        b=c3kuhnBREvcch9aNks3wfQk9MiRSQA1Zg465HsrlG+U0LxoMNxueLX9xd8ygJbR8PP
         sLIABjwmBRQsH+872J472WVgnXQWMnlYLJKxQU0NE4fa4B+dlJPkI5g15u+Chm7gKh25
         jwVmj7hGhDYaeCKoFpYK5fDyrevvN9tqKfYrf7L90CV+UuAYgqVrSwAyJcAUU0Gxitd5
         fZD05pYk6mJ7ntG1zITshQV638TyUv/i0Dg860l8Rpbdd44yA/DZs8Fl6GHpPqEHA7aj
         4PvwRmOqixtm4A46mA66mAm5FuUaj+m5rxgEgdOEcLBiIr88b7PjHnfL02XsquXoBBVE
         GIiw==
X-Gm-Message-State: AOJu0YzmkMWj+XVVRyTNsUMyYBl/riTu3bWqkjq+0hv4bH2mDSPnK9rR
	gHDg4O8KbMvjYamfzloCB7w0eDxej1/vIRg+DeCushHjwmrzAzHxwFHlfarm9p1IHgSBBZgivAR
	jEjyVYQ25r/Iy4kzgBbUA+cZPCDl4cMP7WS6s0Os=
X-Gm-Gg: AR+sD10JgKowsQ5/6v+SY8IE/WzfQ77tzlGclyLDCNVk0cpROFv28q2Nz8EXkqO1j99
	d8w9umq5VIdu7D56vwdTLcFmBUB5pAC2/i1JOrSLTrsbPtjGOJ2VRCpEfhlir/tgrsY16EZ1rNs
	CxmUc2ln62UvZwW8HOP6Zsyi4T5xkzIYKyC7VAOP0+6cxoF3RS5DQQ6Xu+kBcHvdCeFidColwIn
	14cU+hEoORucvU/jQ18ADSEA163qyqNmdSgpGezhlIk5wbbyOD4YhGhHT9MdT2VvEIt16/qc27u
	2vK/dE27TgF7Or9Wnmyru6UWJvdjwJA/2wp1mAMO1C+hivM=
X-Received: by 2002:a17:907:9810:b0:c19:611c:fa8f with SMTP id
 a640c23a62f3a-c1f1ea63b11mr435408466b.18.1785180550427; Mon, 27 Jul 2026
 12:29:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260726171423.42850-1-ishaan.dandekar@gmail.com>
In-Reply-To: <20260726171423.42850-1-ishaan.dandekar@gmail.com>
From: Nikhil Solanke <nikhilsolanke5@gmail.com>
Date: Tue, 28 Jul 2026 00:58:58 +0530
X-Gm-Features: AUfX_mykB3f2yRl1254jygaTtykXcwQWYl6h0xuJ-zuy08QrDQoc38NjhqG8yOs
Message-ID: <CAFgddhLD5xJYf4SjJ3Q34PBEq_k=g-W3=UR0RCSL85OSw6KPHg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Fix initialization for Generic Clone X-Input Gamepads
To: Ishaan Dandekar <ishaan.dandekar@gmail.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 26 Jul 2026 at 22:44, Ishaan Dandekar <ishaan.dandekar@gmail.com> wrote:
>
> This patch series fixes a hardware panic preventing certain generic X-Input
> clone controllers (specifically 0283:0001) from functioning correctly
> in Linux.
>
> When the controller is plugged in, the USB core requests its configuration
> using a 9-byte request. The controller's firmware fails, disconnects, and
> shape-shifts into a fallback Android mode, completely losing its X-Input
> capabilities and haptic feedback (rumble).
>
> Patch 1 (by Nikhil Solanke) builds the underlying core logic to allow
> a 255-byte config request (mimicking Windows behavior).
> Patch 2 adds this specific controller's hardware ID to the new quirk list,
> preventing the crash and locking it in X-Input mode.
>
> Note: While these USB patches keep the device stable in X-Input mode, a
> companion patch is being submitted separately to the linux-input subsystem
> (drivers/input/joystick/xpad.c) to ensure the device is routed correctly
> and retains full haptic feedback and functionality.
>
> Changes in v2:
> - Added missing Signed-off-by from transmitter to Patch 1.
> - Wrapped commit message in Patch 2 to 72 columns.
> - Removed trailing whitespace in Patch 2.
> - Dropped the Input/xpad routing patch (sent separately to linux-input)
>
> Ishaan Dandekar (1):
>   usb: quirks: Add ShanWan gamepad to quirk list
>
> Nikhil Solanke (1):
>   usbcore: Add quirk for 255-bytes initial config read
>
>  .../admin-guide/kernel-parameters.txt         | 10 +++++
>  drivers/usb/core/config.c                     | 39 +++++++++++++++----
>  drivers/usb/core/quirks.c                     |  7 ++++
>  include/linux/usb/quirks.h                    |  3 ++
>  4 files changed, 52 insertions(+), 7 deletions(-)
>
> --
> 2.34.1

You should not include my patches in your series. My patch series will
be applied first separately. Just send your own patch with a note that
your patch depends on my patchseries. These guidelines are present are
in Documentation/process/submitting-patches.rst. Make sure to go
through them once.

Also, I will be updating my patchseries with some minor changes, so
this patchset kinda becomes invalid as my patch in here is outdated.
You'll also need to use the updated link when mentioning this
dependency.

Thanks,
Nikhil Solanke
