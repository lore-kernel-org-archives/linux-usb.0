Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793908271;
	b=zlvLsgLzrzh1gOKVgvcUQEFHnVgp40clkBsxrWbyTkS3tB+t7jW3ItZIqke8cTnB2rHz
	 1h5t0+1a2PEx7LFYOh+f7zcVzE4wtCahb0VN9kZ6hGQlT/cV5Dug3KzdchvlIRCmpRw8H
	 qGL0ASeOVAaStD8JxfR/BRUuoWePriSub1+AVTUxg9W+J3dp6W1b7pS/n00v22B7uG7JZ
	 3gyGi8rfiXLSoc6+6d9AicCEdmjYKM4B7DQZh/IeTX3eeBh06TfwVzVpdOrr5u0ftEBZq
	 U7zvAH8HdGl4fOLo0jRrx3BNCRxNTB0cR5FUEPPtrDUUn3Q+OB30mM0j9+tGGQE7+SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793908271;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2vEL3557GnAH+RQLTF7wg4qPorWUHOfNi54CrCu/uuM=;
	b=TowPOhhjB7s9utS+WMqpzcd6dYt4uD+bUWeZYGoURg0NBJTsXG9hnM4NLjbRbgxSze1v
	 7sKYnUtg6Oswh4jgIljU9wgX6OhWdCQlxdvB/TiNtpiJS9GnYmT/7GUqO0zwTF0xIZt8t
	 yvMxW/QhlOgPyCUD8S0BrX9GORQpjFTvHuFoH9A84ziKd276nV+asAMjHvEr7QQEH1FVl
	 hUTeFnyZw0NWOaiPudXV/7yF9gnBtO9kFasKrJNqd3TxAo23y0fSdI0Awr5q7wlhrneIO
	 bY5LPNwNcBZxRYJyW7hPZZtpsV1I/1U/X+8cqQ5MVcmVsWfRbOgroJKWBm9ebY4ph6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Stgp+am5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC814606A33E
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 19:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Stgp+am5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C1C01F0089F;
	Thu,  5 Nov 2026 19:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793908270;
	bh=2vEL3557GnAH+RQLTF7wg4qPorWUHOfNi54CrCu/uuM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Stgp+am5YuirjPiaNjl5HqROV/l891y3Si8n/VNZY8+eZsObWiIY1U6j9Bt/3TiS0
	 nYHvKNMgr+bc6zglIRff7Lo68P0+qwx1KX1wOXwC9XFnMN7ko4PYKMIwDEcMPN5eHu
	 Jg5C0OfhcNa/+qcvWWyEJ28hZATFI610X4iq0ofBD0siBMUjls14PoNNzpUXBebmXT
	 sHAcyxlL1btCeK2qIohk7A+F4wjVC0BW9QUs53IEfPkQfzvn74PP6E0xQH4P863PFj
	 dd+aJX36qqT8sGXn7sz6OEnK6VNiF4LeLxzDIUcY2vTbV50UFWMsisvY2DA5MW6al5
	 5qIYChZGQQwEQ==
Message-ID: <sashiko-outbox-200020@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFCv2]preliminary support for eh_abort_handler
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oliver Neukum" <oneukum@suse.com>
Cc: "USB list" <linux-usb@vger.kernel.org>
In-Reply-To: <38f81744-9122-4109-90b6-b0a1ac92d248@suse.com>
References: <38f81744-9122-4109-90b6-b0a1ac92d248@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 19:51:09 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [Critical] uas: use-after-free and double-free of killer URB via uas_abor=
t_complete()
- [Critical] uas: stack waitqueue corruption and task state leak in uas_eh_=
abort_handler()
- [High] uas: NULL dereference on cmdinfo->killer in uas_abort_complete()
- [High] uas: leak of unsubmitted URBs on normal abort path in uas_eh_abort=
_handler()
- [High] uas: duplicate status URB behind active sense URB in uas_abort_com=
plete()
- [High] uas: uas_dummy_sense() treats URB unlink errors as clean command c=
ancellation
- [High] uas: tag slot cleared in devinfo->cmnd[] before killing in-flight =
URBs
- [High] uas: uas_eh_abort_handler() does not verify cmnd still owns target=
_tag
- [Low] uas: missing subsystem prefix in subject and informal commit message
--

commit 3bd3a607b7fe69446419fd00011c11e8b7327c84
Author: Oliver Neukum <oneukum@suse.com>

preliminary support for eh_abort_handler

This commit implements command abort support in uas_eh_abort_handler() by
submitting a duplicate TEST_UNIT_READY command IU reusing the timed-out
command's tag to trigger an overlapped-tag error on the UAS target, followed
by a status URB to collect the response.

>     preliminary support for eh_abort_handler
>    =20
>     Hi,
>    =20
>     the older version had serious bugs.
>    =20
>             Regards
>                     Oliver
>    =20
>     Third draft of an actually working eh_abort_handler.
>    =20
>     Signed-off-by: Oliver Neukum <oneukum@suse.com>

[Severity: Low]
This isn't a bug, but the subject line is missing the uas: (or usb: storage:
uas:) subsystem prefix, and the commit message contains email salutations
rather than a technical description. Could the changelog explain why comman=
ds
are aborted by reusing the tag with a TEST_UNIT_READY command IU instead of
issuing a UAS task management function IU?

> diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
> index 8655edbd66b16..7eddc6633c4db 100644
> --- a/drivers/usb/storage/uas.c
> +++ b/drivers/usb/storage/uas.c

[ ... ]

> @@ -166,7 +170,7 @@ static void uas_zap_pending(struct uas_dev_info *devi=
nfo, int result)
>  		cmdinfo =3D scsi_cmd_priv(cmnd);
>  		uas_log_cmd_state(cmnd, __func__, 0);
>  		/* Sense urbs were killed, clear COMMAND_INFLIGHT manually */
> -		cmdinfo->state &=3D ~COMMAND_INFLIGHT;
> +		cmdinfo->state &=3D ~(COMMAND_INFLIGHT | COMMAND_ABORTED);
>  		cmnd->result =3D result << 16;
>  		err =3D uas_try_complete(cmnd, __func__);
>  		WARN_ON(err !=3D 0);

[Severity: High]
If uas_disconnect() or uas_eh_host_reset_handler() calls uas_zap_pending()
while scmd_eh_abort_handler() -> uas_eh_abort_handler() is actively aborting
cmnd, doesn't clearing COMMAND_ABORTED here allow uas_try_complete() to call
scsi_done(cmnd) while the SCSI error handler still owns the command?

[ ... ]

> @@ -730,35 +738,188 @@ static enum scsi_qc_status uas_queuecommand_lck(st=
ruct scsi_cmnd *cmnd)

[ ... ]

> +static void uas_dummy_sense(struct urb *u)
> +{
> +	struct scsi_cmnd *cmnd =3D u->context;
> +	struct uas_cmd_info *cmdinfo =3D scsi_cmd_priv(cmnd);
> +	struct uas_dev_info *devinfo =3D (void *)cmnd->device->hostdata;
> +	int tag =3D cmdinfo->uas_tag;
> +	unsigned long flags;
> +	/*
> +	 * An error implies success
> +	 */
> +	int status =3D u->status;
> +
> +	/*
> +	 * The tag must be freed in every case
> +	 */
> +	spin_lock_irqsave(&devinfo->lock, flags);
> +	devinfo->cmnd[tag - 1] =3D NULL;

[Severity: High]
Can clearing devinfo->cmnd[tag - 1] here in uas_dummy_sense() (and in
uas_abort_complete()) allow uas_queuecommand_lck() on another CPU to reuse
the tag and stream ID before uas_eh_abort_handler() has woken up and killed
the old command's in-flight data_in_urb, data_out_urb, and sense URB?

> +	switch (status) {
> +	case -ESHUTDOWN:
> +	case -ENOENT:
> +	case -ECONNRESET:
> +	case 0:
> +		cmdinfo->cleanly_cancelled =3D 1;
> +		break;
> +	}
> +	spin_unlock_irqrestore(&devinfo->lock, flags);
> +
> +	kfree(u->transfer_buffer);
> +	wake_up_all(&cmdinfo->cancel);
> +}

[Severity: High]
When the status-stage killer URB is unlinked or killed on the host (for
example via usb_kill_anchored_urbs(&devinfo->killer_urbs) in uas_disconnect=
()
or uas_eh_host_reset_handler()), u->status is -ENOENT, -ECONNRESET, or
-ESHUTDOWN.

Why does uas_dummy_sense() set cmdinfo->cleanly_cancelled =3D 1 for these h=
ost
cancellation error codes? If the URB is killed before schedule_timeout(HZ)
expires in uas_eh_abort_handler(), won't uas_eh_abort_handler() see rv > 0
and cmdinfo->cleanly_cancelled =3D=3D 1, returning SUCCESS to the SCSI error
handler when the command was not aborted on the target?

> +
> +static void uas_abort_complete(struct urb *u)
> +{
> +	int status =3D u->status;
> +	struct scsi_cmnd *cmnd =3D u->context;
> +	struct uas_dev_info *devinfo =3D (void *)cmnd->device->hostdata;
> +	struct uas_cmd_info *cmdinfo =3D scsi_cmd_priv(cmnd);
> +	struct usb_device *udev =3D devinfo->udev;
> +	struct response_iu *dummy;
> +	int tag =3D cmdinfo->uas_tag;
> +	unsigned long flags;
> +	int rv;
> +
> +	switch (status) {
> +	default:
> +		/*
> +		 * immediate cleanup
> +		 */
> +		kfree(u->transfer_buffer);
> +		spin_lock_irqsave(&devinfo->lock, flags);
> +		devinfo->cmnd[tag - 1] =3D NULL;
> +		spin_unlock_irqrestore(&devinfo->lock, flags);
> +		wake_up_all(&cmdinfo->cancel);
> +		break;
> +	case 0:
> +		kfree(u->transfer_buffer);
> +		dummy =3D kzalloc(sizeof(*dummy), GFP_ATOMIC);
> +		if (!dummy) {
> +			spin_lock_irqsave(&devinfo->lock, flags);
> +			goto bailout;
> +		}
> +		usb_fill_bulk_urb(cmdinfo->killer, udev, devinfo->status_pipe,
> +				dummy, sizeof(*dummy), uas_dummy_sense, cmnd);
> +		spin_lock_irqsave(&devinfo->lock, flags);
> +		if (devinfo->use_streams)
> +			cmdinfo->killer->stream_id =3D cmdinfo->uas_tag;
> +		usb_anchor_urb(u, &devinfo->killer_urbs);
> +		rv =3D usb_submit_urb(cmdinfo->killer, GFP_ATOMIC);

[Severity: High]
Can this dereference a NULL cmdinfo->killer when uas_abort_complete() races
with a timeout in uas_eh_abort_handler()?

When schedule_timeout(HZ) expires in uas_eh_abort_handler(), it clears
cmdinfo->killer =3D NULL under devinfo->lock before calling
usb_kill_urb(killer):

    spin_lock_irq(&devinfo->lock);
    cmdinfo->killer =3D NULL;
futile:
    spin_unlock_irq(&devinfo->lock);
    usb_kill_urb(killer);

If the command-pipe killer URB completes with status =3D=3D 0 on another CP=
U just
before usb_kill_urb(killer) unlinks it, uas_abort_complete() passes
cmdinfo->killer to usb_fill_bulk_urb() without holding devinfo->lock and th=
en
dereferences cmdinfo->killer->stream_id and usb_submit_urb(cmdinfo->killer,
GFP_ATOMIC). Should uas_abort_complete() use the callback parameter u inste=
ad
of cmdinfo->killer?

[Severity: High]
How does submitting a second URB on devinfo->status_pipe in
uas_abort_complete() interact with the command's existing sense URB?

When a command is queued in uas_submit_urbs() -> uas_submit_sense_urb(), a
sense URB with completion handler uas_stat_cmplt() is already queued on
devinfo->status_pipe (and on stream_id =3D cmdinfo->uas_tag when streams are
enabled).

1. When the target detects the overlapped tag and sends a single Response IU
(RC_OVERLAPPED_TAG), won't the original sense URB at the head of status_pipe
consume it in uas_stat_cmplt()? In uas_stat_cmplt(), uas_try_complete()
returns -EBUSY because COMMAND_ABORTED is set, without setting
cmdinfo->cleanly_cancelled or waking cmdinfo->cancel, while the killer URB
queued behind it never completes and schedule_timeout(HZ) in
uas_eh_abort_handler() times out.

2. If the original command completed just before the duplicate
TEST_UNIT_READY arrived, the target will return a Sense IU (at least 16
bytes) for TEST_UNIT_READY into dummy, which is allocated as sizeof(struct
response_iu) (8 bytes), failing with -EOVERFLOW.

3. On USB 2.0 (!devinfo->use_streams), status_pipe is shared across all tag=
s,
and uas_dummy_sense() does not check the tag or IU ID in u->transfer_buffer,
so could it consume a status IU belonging to an unrelated command?

4. What kills the original sense URB anchored in devinfo->sense_urbs when a
command is aborted?

> +		if (rv < 0) {
> +bailout:
> +			devinfo->cmnd[tag - 1] =3D NULL;
> +			spin_unlock_irqrestore(&devinfo->lock, flags);
> +			usb_unanchor_urb(u);
> +			kfree(dummy);
> +			usb_free_urb(u);
> +		} else {
> +			spin_unlock_irqrestore(&devinfo->lock, flags);
> +		}
> +		break;
> +	}
> +}

[Severity: Critical]
Does jumping to bailout in uas_abort_complete() cause a use-after-free and
double-free of the killer URB?

In uas_eh_abort_handler(), killer is allocated with usb_alloc_urb() (refcou=
nt
1). When the first submission completes and __usb_hcd_giveback_urb() calls
uas_abort_complete(u), if kzalloc() fails or usb_submit_urb() returns an
error (for example because usb_kill_urb() or usb_kill_anchored_urbs() marked
the URB as rejected), the bailout path unanchors u and calls usb_free_urb(u=
).

That drops uas_eh_abort_handler()'s reference while __usb_hcd_giveback_urb()
is still running, so the URB is freed as soon as uas_abort_complete()
returns. Afterwards, uas_eh_abort_handler() (after waiting the full HZ
because bailout also omits wake_up_all(&cmdinfo->cancel)) calls
usb_kill_urb(killer) and usb_free_urb(killer) on the already-freed URB.

> +
> +static int uas_eh_abort_handler(struct scsi_cmnd *cmnd)
> +{
> +	DECLARE_WAITQUEUE(wait, current);
> +	struct uas_cmd_info *cmdinfo =3D scsi_cmd_priv(cmnd);
> +	struct uas_dev_info *devinfo =3D (void *)cmnd->device->hostdata;
> +	struct usb_device *udev =3D devinfo->udev;
> +	struct urb *data_in_urb =3D NULL;
> +	struct urb *data_out_urb =3D NULL;
> +	struct urb *killer =3D NULL;
> +	struct command_iu *bullet =3D NULL;
> +	int target_tag, rv;
> +	int result =3D FAILED;
> +
> +	killer =3D usb_alloc_urb(0, GFP_NOIO);
> +
> +	set_current_state(TASK_UNINTERRUPTIBLE);
> +	add_wait_queue(&cmdinfo->cancel, &wait);
> +	spin_lock_irq(&devinfo->lock);
> +	if (devinfo->resetting)
> +		goto futile;
> +	target_tag =3D cmdinfo->uas_tag;
> =20
>  	/* Ensure that try_complete does not call scsi_done */
>  	cmdinfo->state |=3D COMMAND_ABORTED;

[Severity: High]
What happens if cmnd completed via uas_try_complete() in the window between
the block layer timeout and uas_eh_abort_handler() acquiring devinfo->lock?

In that window, uas_try_complete() clears devinfo->cmnd[cmdinfo->uas_tag - =
1]
=3D NULL and frees unsubmitted URBs, and uas_queuecommand_lck() may have
already assigned target_tag to a newly queued command. Since
uas_eh_abort_handler() does not check whether devinfo->cmnd[target_tag - 1]
=3D=3D cmnd under devinfo->lock, won't it send a duplicate-tag abort for a =
tag
now owned by a different command (or clear that new command's slot in
devinfo->cmnd[] and double-free unsubmitted URBs on the admit_failure path)?

> -	/* Drop all refs to this cmnd, kill data urbs to break their ref */
> -	devinfo->cmnd[cmdinfo->uas_tag - 1] =3D NULL;
> -	if (cmdinfo->state & DATA_IN_URB_INFLIGHT)
> -		data_in_urb =3D usb_get_urb(cmdinfo->data_in_urb);
> -	if (cmdinfo->state & DATA_OUT_URB_INFLIGHT)
> -		data_out_urb =3D usb_get_urb(cmdinfo->data_out_urb);
> -
> -	uas_free_unsubmitted_urbs(cmnd);
> +	if (!killer)
> +		goto admit_failure;
> +	cmdinfo->killer =3D killer;
> +	bullet =3D allocate_double_command(target_tag, cmnd->device);
> +	if (!bullet)
> +		goto admit_failure;
> +
> +	usb_fill_bulk_urb(killer, udev, devinfo->cmd_pipe,
> +			bullet, sizeof(*bullet), uas_abort_complete, cmnd);
> +
> +	cmdinfo->killer =3D killer;
> +
> +	usb_anchor_urb(killer, &devinfo->killer_urbs);
> +	rv =3D usb_submit_urb(killer, GFP_ATOMIC);
> +	if (rv < 0) {
> +admit_failure:
> +		/* Drop all refs to this cmnd, kill data urbs to break their ref */
> +		devinfo->cmnd[cmdinfo->uas_tag - 1] =3D NULL;
> +		if (cmdinfo->state & DATA_IN_URB_INFLIGHT)
> +			data_in_urb =3D usb_get_urb(cmdinfo->data_in_urb);
> +		if (cmdinfo->state & DATA_OUT_URB_INFLIGHT)
> +			data_out_urb =3D usb_get_urb(cmdinfo->data_out_urb);
> =20
> -	spin_unlock_irqrestore(&devinfo->lock, flags);
> +		uas_free_unsubmitted_urbs(cmnd);
> +		spin_unlock_irq(&devinfo->lock);
> +		usb_unanchor_urb(killer);
> +		kfree(bullet);
> +	} else {
> +		spin_unlock_irq(&devinfo->lock);
> +		rv =3D schedule_timeout(HZ);
> +		if (rv)
> +			result =3D cmdinfo->cleanly_cancelled ? SUCCESS : FAILED;
> +		spin_lock_irq(&devinfo->lock);
> +		if (cmdinfo->state & DATA_IN_URB_INFLIGHT)
> +			data_in_urb =3D usb_get_urb(cmdinfo->data_in_urb);
> +		if (cmdinfo->state & DATA_OUT_URB_INFLIGHT)
> +			data_out_urb =3D usb_get_urb(cmdinfo->data_out_urb);
> +		spin_unlock_irq(&devinfo->lock);
> +	}

[Severity: High]
Does the else branch leak unsubmitted URBs (cmdinfo->cmd_urb,
cmdinfo->data_in_urb, and cmdinfo->data_out_urb)?

When usb_submit_urb(killer, GFP_ATOMIC) succeeds, uas_free_unsubmitted_urbs=
()
is never called on this path, and uas_try_complete() will not free them
because COMMAND_ABORTED is set. On USB 2.0 (!devinfo->use_streams) where da=
ta
URBs are allocated up front but only submitted upon receiving
IU_ID_READ_READY or IU_ID_WRITE_READY (or when uas_do_work() is pending), a=
ny
unsubmitted URBs on cmnd appear to be leaked.

Also, if schedule_timeout(HZ) times out (rv =3D=3D 0), devinfo->cmnd[target=
_tag -
1] is still non-NULL when DATA_IN_URB_INFLIGHT and DATA_OUT_URB_INFLIGHT are
checked above, and IS_IN_WORK_LIST is not cleared. Could uas_do_work() or
uas_stat_cmplt() submit data_in_urb or data_out_urb after this check and
leave a data URB in flight after uas_eh_abort_handler() returns?

> +	set_current_state(TASK_RUNNING);
> +	remove_wait_queue(&cmdinfo->cancel, &wait);
> +	/*
> +	 * we know a callback will free the tag
> +	 */
> +	spin_lock_irq(&devinfo->lock);
> +	cmdinfo->killer =3D NULL;
> +futile:
> +	spin_unlock_irq(&devinfo->lock);
> +	usb_kill_urb(killer);
> +	usb_free_urb(killer);

[Severity: Critical]
If devinfo->resetting is true when uas_eh_abort_handler() acquires
devinfo->lock, jumping to futile skips set_current_state(TASK_RUNNING) and
remove_wait_queue(&cmdinfo->cancel, &wait).

Doesn't that call usb_kill_urb(killer) while current is still in
TASK_UNINTERRUPTIBLE state, and then return from uas_eh_abort_handler() with
the stack-allocated wait entry still linked on cmdinfo->cancel?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/38f81744-9122-4109-=
90b6-b0a1ac92d248@suse.com?part=3D1
