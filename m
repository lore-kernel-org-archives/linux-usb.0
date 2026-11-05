Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793897152;
	b=pTYhAC2Qwr4pw+bLxdXUQV7b+MZQlJN3flK/lQTSzjLZ86PYqOKQ2OC/JO6nhYXWBPDO
	 +MEqbu8VdarI659VlHEKekJ0+1jn0esZqg0WOY0Iseyw8e3bxC8OoHP3c8gB4WcB8uKhz
	 f2RijWcSqDxxcxSKDwSDiiRNKkjJQeCFLm66Was7SBFJFhyFss17Ic2QELWlzMNjiZq7O
	 AARoN38j618+GVWOEjI/poeSwDPx+fAj8ntcLKgDhidZEuR7g7U5wRss6kZ3bIIZSYpkf
	 ls4qe0pzvjPGRNjtpTiJbqtBJnB7WO6MO9vlpQR/TcV3laghTQJinRgkEAc70Ot/SgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793897152;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=UqTNYt0orVb3OIDUoccxdh8EdCSCeRzKDMXX05PY8W4=;
	b=3CY2ZYlw8G9r+VDC2A6/K81/kkFJn36OU4pPbiLfJyt4WT5y3E6eb1gh0uWyZQ1ME4x+
	 /4mdlwf+lG+igrA9XlsKVkUbCEG6VXU3luqJhi16PTKraF1TeT5NN5EfLdVTamRHYxH0t
	 KpW4we8NyE5vJka2waCcL4XniFf+D/QlmdcESpW3SbMQA/ISFFbu7YMr2G84r/vl0qrIF
	 3zELJoMjJNQz09Jo0fNitTU9RTubmczkdwDSW/HmuPu0CuUG/nw7tYLiJUiYVrnE2Ky3i
	 WTvD5h7HD5ZToz4hn73UzC1aaJRyuEFOWoGVyFbpIKgqBIChd1ad9G33hzpwT6F+2Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=crd2dIPV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8537606D828;
	Thu,  5 Nov 2026 16:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=crd2dIPV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93D211F00A02;
	Thu,  5 Nov 2026 16:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793897151;
	bh=UqTNYt0orVb3OIDUoccxdh8EdCSCeRzKDMXX05PY8W4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=crd2dIPVBGtL7yeIRche4O4/nbLBjmp7z6VqhsVnUXbaz81FnuDgw9ARAt+0lTr7E
	 fmlcizmuVsK25zQaxHlewPKh87nZsecQ9V6vnpqWTjf/jTDC6eY9fpT4HeVhLnwDu+
	 jyVMui+vE9VGTnhyCgPZG8FJC4ko5CWbLfWKpawTetkleyYfPts3+H5j5FXWRLUEiw
	 5RkvAZKuWtD6v07Q5+nD40YFtrDgY9tLDvu9XQDIj0hd2f72tGeTmWqPvO+qEx0mVK
	 m+wtFCC1gWOOiwUL+RWfETawKz3aqb5jm9tl6RzN2rt9T7kYK15BJyGf9Kd3/Xz3pn
	 yvhloXnSECrrA==
Message-ID: <sashiko-outbox-199524@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 5/8] ALSA: usb: babyfacepro: add S3 suspend/resume
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SXNtYcOvbCBCYWhsb3Vs?= <i.bahloul01@gmail.com>, linux-sound@vger.kernel.org
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261105151553.223722-6-i.bahloul01@gmail.com>
References: <20261105151553.223722-1-i.bahloul01@gmail.com>
 <20261105151553.223722-6-i.bahloul01@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 16:45:51 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] ALSA: usb: babyfacepro: missing snd_power_change_state() in susp=
end and resume
- [Low] ALSA: usb: babyfacepro: babyface_suspend() walks private card->devi=
ces list
--

commit f0c674e7a86798c445b9cc47638dc398955e5a17
Author: Isma=C3=AFl Bahloul <i.bahloul01@gmail.com>

ALSA: usb: babyfacepro: add S3 suspend/resume

This commit adds system suspend, resume, and reset_resume callbacks to the
RME Babyface Pro USB audio driver. On suspend, it suspends PCM substreams,
kills active URBs, and cancels stream work; on resume, it re-runs cold
initialization and restores cached mixer state and flags.

> diff --git a/sound/usb/babyfacepro/babyfacepro.c b/sound/usb/babyfacepro/=
babyfacepro.c
> index 12cfd7fea3315..06ef1a97d27a4 100644
> --- a/sound/usb/babyfacepro/babyfacepro.c
> +++ b/sound/usb/babyfacepro/babyfacepro.c

[ ... ]

> @@ -1752,6 +1764,62 @@ static void babyface_disconnect(struct usb_interfa=
ce *intf)
>  	snd_card_free_when_closed(chip->card);
>  }
> =20
> +static int babyface_suspend(struct usb_interface *intf, pm_message_t mes=
sage)
> +{
> +	struct snd_usb_babyface *chip =3D usb_get_intfdata(intf);
> +
> +	struct snd_device *sdev;
> +
> +	if (!chip)
> +		return 0;
> +	list_for_each_entry(sdev, &chip->card->devices, list) {
> +		if (sdev->type =3D=3D SNDRV_DEV_PCM)
> +			snd_pcm_suspend_all(sdev->device_data);
> +	}

[Severity: Low]
This isn't a bug, but why walk the internal chip->card->devices list here?

card->devices and struct snd_device are internal to sound/core/device.c and
are not meant to be traversed directly by drivers. In addition, the commit
message notes:

  On suspend, let the PCM core suspend the substreams (applications get
  -ESTRPIPE and restart)

With USB autosuspend disabled, the PCM core already registers pcm_dev_pm_ops
(do_pcm_suspend() in sound/core/pcm.c) on the child PCM device, which calls
snd_pcm_suspend_all() before the parent USB interface suspend callback runs.
If the driver ever needs to reference its PCM instance directly, could it
store the struct snd_pcm pointer returned by snd_pcm_new() in struct
snd_usb_babyface instead of iterating over chip->card->devices?

> +	/* The URB handlers queue the work: kill them first. */
> +	scoped_guard(mutex, &chip->mutex) {
> +		if (chip->streaming)
> +			babyface_stream_kill(chip);
> +	}
> +	cancel_work_sync(&chip->stream_work);
> +	return 0;
> +}
> +
> +static int babyface_resume(struct usb_interface *intf)
> +{
> +	struct snd_usb_babyface *chip =3D usb_get_intfdata(intf);
> +	int err;
> +
> +	if (!chip)
> +		return 0;
> +
> +	/* The device lost its state across the suspend; re-run the cold
> +	 * init and re-apply the cached mixer state.  Suspended PCM
> +	 * substreams are woken by the core - apps get -ESTRPIPE and
> +	 * restart (prepare starts a new session).
> +	 *
> +	 * This is also the reset_resume handler.  Some hosts reset the
> +	 * device on resume; that needs nothing more than the cold init
> +	 * already does here, and without the handler the USB core unbinds
> +	 * and re-probes the driver instead: the card goes away, open PCMs
> +	 * fail, and udev's alsactl restore then loads the mixer state
> +	 * stored at the last shutdown over the current one.
> +	 */
> +	guard(mutex)(&chip->mutex);
> +	err =3D usb_set_interface(chip->dev, BF_IFACE, chip->alt);
> +	if (err < 0)
> +		return err;
> +	err =3D bf_cold_init(chip);
> +	if (err < 0)
> +		return err;
> +	err =3D babyface_restore_state(chip);
> +	if (err < 0)
> +		return err;
> +	err =3D bf_state_apply_flags(chip);
> +
> +	return err;
> +}

[Severity: Medium]
Should babyface_suspend() and babyface_resume() update the card power state
via snd_power_change_state()?

In ALSA core (sound/core/pcm_native.c and sound/core/control.c), entry
points such as snd_pcm_common_ioctl(), snd_pcm_release(),
snd_ctl_elem_read_user(), snd_ctl_elem_write_user(),
snd_ctl_elem_info_user(), and snd_ctl_tlv_ioctl() call snd_power_wait() or
snd_power_ref_and_wait(), which only block while snd_power_get_state(card)
is not SNDRV_CTL_POWER_D0.

Because babyface_suspend() never sets SNDRV_CTL_POWER_D3hot and
babyface_resume() never restores SNDRV_CTL_POWER_D0, chip->card->power_state
stays at SNDRV_CTL_POWER_D0 across the entire suspend and resume cycle.
Couldn't a user-space audio server woken by snd_pcm_suspend_all() (receiving
-ESTRPIPE) or issuing SNDRV_PCM_IOCTL_PREPARE or control writes enter
babyface_pcm_prepare() or mixer callbacks while the interface is suspending,
suspended, or before babyface_resume() finishes restoring hardware register=
s?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105151553.2237=
22-1-i.bahloul01@gmail.com?part=3D5
