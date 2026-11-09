Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794183196;
	b=0xffgEegff9aRchqqniQKGh4sV1laGIWoK+tMbGLhhHH4i/iEf2OHCa6Y6+0nOaQrmzr
	 DQqyzxlC/kMbNz+U4kNN8T4UpouDyb6Yl8AB+oi3ALDuBcp1lA/SPFPbodPa6OA1MUYja
	 HJJDa+3xU5Og5M45I9iZG0NNg4PC5Hq3RI2FF1nxlesDULlAd5WKHLnYO2XylcJp5roCZ
	 WmolaBB7bzgxEhVCh/DV9bT8ZaIMPJFKbxpDhDLbYswp8NT52g05od4tlC1boI+pKieq0
	 NNs88Z3ftmnZih+012kIJr9YK7QusLnS3+RorWCQcMlS3+YmWEpzVU3zzUBAv24hySg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794183196;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=DOWoGk79A9eNoZPAHAujRth+vHFzEz70nJ6wMuEfyrc=;
	b=CMAbCJfPu0J5Q5eCIaIoJ3udvl8FPXRo/u62bamQuHr9xj/6zp+OioCURT4LPMEVHUpO
	 5n7LRzBi8i/1FPBjjrVWrFCSCWTQzWGiVs5QlJXl9s14ZU1yiEIf+om7Z7+CDZfwa8SGr
	 7cP/519FUFoDEpWeFYurTfouydj/h2IGkzNDCmWwK5Bu77le8xS4DxgiG9+HQPebtFkAf
	 lx22wjIhp1q/Pm3Y9+0omyarCGJX/4rzWZhXOf98tIag/uFpxK0lDRc/VTLYj2fwWU6Pi
	 91WkBg2Oo5Qks+NW03DszPxDYAjTMcBsn8JSjR3JgkkqyZIYj4NHtLc5sJ2Lx77tGAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="EL/rRb74";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B8F606A31C
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 00:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EL/rRb74
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82B691F0089F;
	Mon,  9 Nov 2026 00:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794183195;
	bh=DOWoGk79A9eNoZPAHAujRth+vHFzEz70nJ6wMuEfyrc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EL/rRb74m9nHlijtWE3toogHQ3RzAnJdyaNbykCkn+UJEJ39x47fSj/QVziopk5cJ
	 oE4Q5dXCJuccP3MSyi0y9qAzPWTXd1WbQgKAnJUYKLvIBCPbpXM4HBJGAA3UOzXztW
	 4lRzovN6IBe+tdrGGXIW1q350GU2JDOJTOZjy3eADKSP8n44VbdDLDErDjjPQa8DgG
	 RnXjwOIN1OxTg/xqKd4hr2zzd9whJVBUr8NrwWgAmtYp3ZCwvKbRb3Fxfnrp03G4bM
	 hac9oXhfikCoLJL01WfL5Zs4nZEVGSDcvlh0FEKDtl9r24+rd1iuFliL9bJ0vREJMW
	 VEiYW91nBETKg==
Message-ID: <sashiko-outbox-204202@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: storage: don't hold dev_mutex across the
 max_lun control transfer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shuai Liu" <847807867@qq.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <tencent_5A9A9E45415EADE916B7558C66A2C4DD4F05@qq.com>
References: <tencent_5A9A9E45415EADE916B7558C66A2C4DD4F05@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 00:13:15 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] usb: storage: unlocked usb_stor_Bulk_max_lun() races with reset
  and I/O
--

commit f8913af4317f2585b6b4e25b82f0040382c7198c
Author: Shuai Liu <847807867@qq.com>

usb: storage: don't hold dev_mutex across the max_lun control transfer

This commit changes usb_stor_Bulk_max_lun() to use usb_control_msg_recv()
and calls it outside us->dev_mutex in usb_stor_scan_dwork().

> diff --git a/drivers/usb/storage/usb.c b/drivers/usb/storage/usb.c
> index 823a4b2e9033b..d973bfd0f23d1 100644
> --- a/drivers/usb/storage/usb.c
> +++ b/drivers/usb/storage/usb.c
> @@ -980,19 +980,26 @@ static void usb_stor_scan_dwork(struct work_struct =
*work)
> =20
>  	dev_dbg(dev, "starting scan\n");
> =20
> -	/* For bulk-only devices, determine the max LUN value */
> +	/*
> +	 * For bulk-only devices, determine the max LUN value.
> +	 * usb_stor_Bulk_max_lun() sleeps in a synchronous transfer, so it
> +	 * must not run under us->dev_mutex (the reset path takes dev_mutex
> +	 * while holding the device lock).  Lock only to publish the result.
> +	 */
>  	if (us->protocol =3D=3D USB_PR_BULK &&
>  	    !(us->fflags & US_FL_SINGLE_LUN) &&
>  	    !(us->fflags & US_FL_SCM_MULT_TARG)) {
> +		int max_lun =3D usb_stor_Bulk_max_lun(us);
> +
>  		mutex_lock(&us->dev_mutex);
> -		us->max_lun =3D usb_stor_Bulk_max_lun(us);
> +		us->max_lun =3D max_lun;
>  		/*
>  		 * Allow proper scanning of devices that present more than 8 LUNs
>  		 * While not affecting other devices that may need the previous
>  		 * behavior
>  		 */
> -		if (us->max_lun >=3D 8)
> -			us_to_host(us)->max_lun =3D us->max_lun+1;
> +		if (max_lun >=3D 8)
> +			us_to_host(us)->max_lun =3D max_lun + 1;
>  		mutex_unlock(&us->dev_mutex);
>  	}

[Severity: High]
Does calling usb_stor_Bulk_max_lun() without us->dev_mutex break the
quiescence contract of usb_stor_pre_reset() and usb_stor_suspend(), and
race with concurrent resets or SCSI commands?

usb_stor_pre_reset() and usb_stor_suspend() take us->dev_mutex to ensure
all driver URBs have completed and no new URBs are submitted during reset
or suspend:

drivers/usb/storage/usb.c:usb_stor_pre_reset() {
	struct us_data *us =3D usb_get_intfdata(iface);

	/* Make sure no command runs during the reset */
	mutex_lock(&us->dev_mutex);
	return 0;
}

With usb_stor_Bulk_max_lun() unlocked:

CPU0 (scan_dwork)                 CPU1 (usb_reset_device)
usb_stor_scan_dwork()
                                  usb_stor_pre_reset()
                                    mutex_lock(&us->dev_mutex)
                                  usb_reset_and_verify_device()
                                    hub_port_reset()
  usb_stor_Bulk_max_lun()
    usb_control_msg_recv()  <-- EP0 transfer runs during reset and fails
                                  usb_stor_post_reset()
                                    mutex_unlock(&us->dev_mutex)
  mutex_lock(&us->dev_mutex)
  us->max_lun =3D 0;          <-- LUNs > 0 permanently lost

Instead of waiting on us->dev_mutex for usb_stor_post_reset() to finish,
usb_control_msg_recv() runs during port reset and EP0 re-enumeration,
fails, and causes usb_stor_Bulk_max_lun() to return 0, hiding all LUNs
above 0 on multi-LUN devices.  Because scsi_add_host() is called in
usb_stor_probe2() before scan_dwork runs, an unlocked GET_MAX_LUN can also
run concurrently on the device with Bulk-Only transfers and resets in
usb_stor_control_thread() and device_reset().

Also, is the ABBA deadlock described in the comment and commit message
possible?  Neither usb_stor_control_msg() nor usb_submit_urb() acquires
udev->dev.mutex, and quiesce_and_remove_host() never takes us->dev_mutex
either; it waits in cancel_delayed_work_sync(&us->scan_dwork) for the work
item to finish, while switching from usb_stor_control_msg() to
usb_control_msg_recv() makes the 10-second wait uninterruptible and no
longer abortable via US_FLIDX_ABORTING.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/tencent_5A9A9E45415=
EADE916B7558C66A2C4DD4F05@qq.com?part=3D1
