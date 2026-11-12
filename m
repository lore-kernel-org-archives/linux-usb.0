Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794492104;
	b=2qbqwh+ZSyavICWsH//I360fOt4kAcfj7LQS6c5bccsWh0nV5sKu4I9j5jh+lLYtgbsR
	 15Z6VX/d+xfUcwb2/P2+AjEEJOHy6BR33bqaf3kcQPZX3bV0KwRHLVwrZMCgubvJBPVX3
	 eB4ZxK9UK2klsRk4LGovsPl/zgR2pQfb/jIGMplmzEzYKptMZHROyAZZRGZVeACQil601
	 rOi/hqiFFfBI3diVEY7A1RWGYtv2gHoW/i3W1ZVPE9kDJcg4vohSfLclF5TjdP27yWQ7/
	 CaJOOdol4P2Ztc01TQMakGiBAZanq1i05KYzphjyuGDlI9UHChWsLEZ70EZbPE53fWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492104;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Q3WZw67EhSNY/Vt96QnoXcTMQ7UpuwGCGlvwR16yVfY=;
	b=hrkl5a+GFZ0VBBAjWJ1gXgjnlULYmPs8+bIHbPgIEHR1e+7nqYnJVRCXYvmWXUjpYpkS
	 5CTQ4r96lQzaVhVx9UdyF6r2AVeJ6CqjbleEnLnc/MdztwRDwkkR68kanJrSicCr5D6+S
	 DajtWVqr/I2sXeV7+F88P8GtP6HUTttJAjMtYz7rjygNzxmjzqZ9sJQbhLTCqwNE/vq8Z
	 ITHuHJDqrQca84OMSnLXVOaeu976bw/2X/zn1Fl47M/PJZMLgGhDq9v6IQ+wbwlB4h+ia
	 oaoDdFyUYExCAYYWUTB4y8hEbzp6diudDBfJsY8+R8xiZM1HLrGG45x3gxSrwplIiqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="DX/EyozF";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A19606C482
	for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 14:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DX/EyozF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD4981F00A05;
	Thu, 12 Nov 2026 14:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794492103;
	bh=Q3WZw67EhSNY/Vt96QnoXcTMQ7UpuwGCGlvwR16yVfY=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=DX/EyozFJnTRN3P++8Ghh0OwZFe5uV/36nNznxxD23yXlRLjU5/Jzg/9lAuzgTbMF
	 KJgrKiDMffJqzOByL0GxZGhDuHu+M9agyXPWZ4siGYkoCPWZqt2iBdZPMEff2VTpoU
	 CHxtMqmcThn9RUdIyovTsaDBNKIkwEyN8HcQbdbXBeTJoDI695IW0o9jZgu+hPsJN/
	 jOeuzDpts5OGvfhvSnHNJ5TgHs1NnxchNJa4ZSbRnsqwrATzB6lwfdfrpsoAxowSm/
	 JHb5zkZ7tCctBK+K8Bcjh4hxbed4XWPt5KPnnokZ5vlUeHV612bFEZM5bgV4HEluJQ
	 K2uPOBTFMtdBA==
Message-ID: <sashiko-outbox-211252@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC]usb: uas: cancel outstanding commands
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oliver Neukum" <oneukum@suse.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261112133926.878432-1-oneukum@suse.com>
References: <20261112133926.878432-1-oneukum@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 14:01:43 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 9 potential
issues to consider:
- [High] usb: uas: double free of killer URB on bailout in
  uas_abort_complete()
- [High] usb: uas: NULL dereference on cmdinfo->killer in
  uas_abort_complete()
- [High] usb: uas: stack waitqueue corruption on futile path in
  uas_eh_abort_handler()
- [High] usb: uas: false SUCCESS return on URB error wakeup in
  uas_eh_abort_handler()
- [High] usb: uas: leak of unsubmitted URBs and unstopped work in
  uas_eh_abort_handler()
- [High] usb: uas: premature tag release and missing active check in
  uas_eh_abort_handler()
- [High] usb: uas: undersized dummy buffer and IU misrouting in
  uas_abort_complete()
- [High] usb: uas: uas_zap_pending() clears COMMAND_ABORTED on EH-owned
  commands
- [Medium] usb: uas: cleanly_cancelled set on RC_TMF_SUCCEEDED instead
  of IU_ID_STATUS
--

commit 40b90ce0c743eab1a72ea58e353c48af3de8be9d
Author: Oliver Neukum <oneukum@suse.com>

usb: uas: cancel outstanding commands

This commit implements command abort handling in uas_eh_abort_handler() by
submitting a duplicate TEST_UNIT_READY command with the same tag to force
an overlapped-tag error on the device.

> diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
> index 8655edbd66b16..99ded579349a3 100644
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
Can clearing COMMAND_ABORTED here cause a double completion of cmnd and a
double free of its unsubmitted URBs?

Once a command enters uas_eh_abort_handler(), it is owned by SCSI error
recovery and COMMAND_ABORTED is set so uas_try_complete() will not call
uas_free_unsubmitted_urbs() and scsi_done().  If uas_disconnect() or
uas_eh_host_reset_handler() runs while uas_eh_abort_handler() is still
active on cmnd (for instance, before devinfo->cmnd[tag - 1] is cleared),
uas_zap_pending() clears COMMAND_ABORTED and completes cmnd via
uas_try_complete() while uas_eh_abort_handler() and SCSI EH still own it.

> @@ -274,6 +278,7 @@ static void uas_xfer_data(struct urb *urb, struct scs=
i_cmnd *cmnd,
> =20
>  static bool uas_evaluate_response_iu(struct response_iu *riu, struct scs=
i_cmnd *cmnd)
>  {
> +	struct uas_cmd_info *cmdinfo =3D scsi_cmd_priv(cmnd);
>  	u8 response_code =3D riu->response_code;
> =20
>  	switch (response_code) {
> @@ -282,10 +287,17 @@ static bool uas_evaluate_response_iu(struct respons=
e_iu *riu, struct scsi_cmnd *
>  		break;
>  	case RC_TMF_SUCCEEDED:
>  		set_host_byte(cmnd, DID_OK);
> +		/* in case we win the race */
> +		cmdinfo->cleanly_cancelled =3D 1;
>  		break;
>  	case RC_TMF_NOT_SUPPORTED:
>  		set_host_byte(cmnd, DID_BAD_TARGET);
>  		break;
> +	case RC_OVERLAPPED_TAG:
> +		set_host_byte(cmnd, DID_ABORT);
> +		cmdinfo->cleanly_cancelled =3D 1;
> +		wake_up_all(&cmdinfo->cancel);
> +		break;

[Severity: Medium]
Should cmdinfo->cleanly_cancelled be set in the IU_ID_STATUS case of
uas_stat_cmplt() instead of RC_TMF_SUCCEEDED?

uas_evaluate_response_iu() only runs for IU_ID_RESPONSE (Task Management
response IUs), which the uas driver never sends.  When the command being
aborted finishes normally before the duplicate tag arrives, it completes
through IU_ID_STATUS in uas_stat_cmplt(), leaving cleanly_cancelled unset
and cmdinfo->cancel unwoken.

[ ... ]
> @@ -730,35 +743,197 @@ static enum scsi_qc_status uas_queuecommand_lck(st=
ruct scsi_cmnd *cmnd)
>  static DEF_SCSI_QCMD(uas_queuecommand)
> =20
>  /*
> - * For now we do not support actually sending an abort to the device, so
> - * this eh always fails. Still we must define it to make sure that we've
> - * dropped all references to the cmnd in question once this function exi=
ts.
> + * We abort a command by reusing the tag, thus forcing an error
>   */
> +
> +static struct command_iu *allocate_double_command(int tag, struct scsi_d=
evice *sdev)
> +{
> +	struct command_iu *test_unit_ready;
> +
> +	test_unit_ready =3D kzalloc(sizeof(*test_unit_ready), GFP_ATOMIC);
> +	if (!test_unit_ready)
> +		return NULL;
> +
> +	test_unit_ready->iu_id =3D IU_ID_COMMAND;
> +	test_unit_ready->tag =3D cpu_to_be16(tag);
> +	test_unit_ready->prio_attr =3D UAS_SIMPLE_TAG;
> +	int_to_scsilun(sdev->lun, &test_unit_ready->lun);
> +	/*
> +	 * We need something that does not do harm
> +	 * if the command to be aborted does finish
> +	 * regularly
> +	 */
> +	test_unit_ready->cdb[0] =3D TEST_UNIT_READY;
> +
> +	return test_unit_ready;
> +}
> +
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
> +	spin_unlock_irqrestore(&devinfo->lock, flags);
> +
> +	kfree(u->transfer_buffer);
> +	wake_up_all(&cmdinfo->cancel);
> +	dev_info(&u->dev->dev, "Dummy sense completed with status %d\n", status=
);
> +}
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

[Severity: High]
Isn't struct response_iu (8 bytes) too small for the status_pipe transfer
here?

allocate_double_command() sends a TEST_UNIT_READY Command IU.  If the
original command finishes just before TEST_UNIT_READY reaches the device,
the device executes TEST_UNIT_READY as a normal command and returns a
struct sense_iu (at least 16 bytes) on status_pipe, overflowing the 8-byte
buffer with -EOVERFLOW.

In addition, on USB 2.0 (!devinfo->use_streams), all tags share a single
FIFO queue on status_pipe without stream IDs, and uas_stat_cmplt() matches
completions by reading iu->tag.  Submitting a status URB with
uas_dummy_sense(), which ignores iu->tag and uses u->context, will blindly
consume whatever status or ready IU arrives next on status_pipe for any
other in-flight command.

> +		if (devinfo->use_streams)
> +			cmdinfo->killer->stream_id =3D cmdinfo->uas_tag;
> +
> +		spin_lock_irqsave(&devinfo->lock, flags);
> +		usb_anchor_urb(u, &devinfo->killer_urbs);
> +		rv =3D usb_submit_urb(cmdinfo->killer, GFP_ATOMIC);

[Severity: High]
Can cmdinfo->killer be NULL here when uas_abort_complete() races with
uas_eh_abort_handler()?

CPU0                              CPU1
uas_eh_abort_handler()            <softirq>
  schedule_timeout(HZ)            uas_stat_cmplt()
                                    uas_evaluate_response_iu()
                                      wake_up_all(&cmdinfo->cancel)
  spin_lock_irq(&devinfo->lock)
  cmdinfo->killer =3D NULL
  spin_unlock_irq(&devinfo->lock)
                                  uas_abort_complete(u)
                                    usb_fill_bulk_urb(cmdinfo->killer, ...)
                                      <-- NULL pointer dereference
  usb_kill_urb(killer)

Because RC_OVERLAPPED_TAG is delivered on the original sense URB on
status_pipe, uas_stat_cmplt() can wake uas_eh_abort_handler() before the
killer Command IU URB completion finishes running uas_abort_complete().
uas_eh_abort_handler() clears cmdinfo->killer to NULL before calling
usb_kill_urb(killer), while uas_abort_complete() uses cmdinfo->killer
instead of u.

> +		if (rv < 0) {
> +bailout:
> +			devinfo->cmnd[tag - 1] =3D NULL;
> +			spin_unlock_irqrestore(&devinfo->lock, flags);
> +			usb_unanchor_urb(u);
> +			kfree(dummy);
> +			usb_free_urb(u);

[Severity: High]
Does calling usb_free_urb(u) in the bailout path cause a use-after-free
and double free of killer?

killer is allocated in uas_eh_abort_handler() with one initial reference
and unconditionally freed at the end of uas_eh_abort_handler() via
usb_kill_urb(killer) and usb_free_urb(killer).  Dropping a reference here
in the completion callback (when kzalloc() fails or usb_submit_urb()
returns an error, such as when usb_kill_urb() sets killer->reject) causes
__usb_hcd_giveback_urb() to drop the last reference and free the URB before
uas_eh_abort_handler() kills and frees it again.  The bailout path also
misses wake_up_all(&cmdinfo->cancel), leaving uas_eh_abort_handler() to
sleep for the full 1-second timeout.

> +		} else {
> +			spin_unlock_irqrestore(&devinfo->lock, flags);
> +			dev_info(&u->dev->dev, "Submitted dummy tag %d\n", tag -1);
> +		}
> +		break;
> +	}
> +}
> +
>  static int uas_eh_abort_handler(struct scsi_cmnd *cmnd)
>  {
> +	DECLARE_WAITQUEUE(wait, current);
>  	struct uas_cmd_info *cmdinfo =3D scsi_cmd_priv(cmnd);
>  	struct uas_dev_info *devinfo =3D (void *)cmnd->device->hostdata;
> +	struct usb_device *udev =3D devinfo->udev;
>  	struct urb *data_in_urb =3D NULL;
>  	struct urb *data_out_urb =3D NULL;
> -	unsigned long flags;
> +	struct urb *killer =3D NULL;
> +	struct command_iu *bullet =3D NULL;
> +	int target_tag, rv;
> +	int result =3D FAILED;
> =20
> -	spin_lock_irqsave(&devinfo->lock, flags);
> +	killer =3D usb_alloc_urb(0, GFP_NOIO);
> =20
> -	uas_log_cmd_state(cmnd, __func__, 0);
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
What happens if cmnd completed normally just before uas_eh_abort_handler()
acquired devinfo->lock, or if the tag is reused as soon as the abort
callbacks clear devinfo->cmnd[tag - 1]?

First, if cmnd completed via uas_try_complete() before devinfo->lock was
taken, devinfo->cmnd[target_tag - 1] was cleared and uas_queuecommand_lck()
may have already assigned target_tag to a newly queued command.  Without
checking that devinfo->cmnd[target_tag - 1] =3D=3D cmnd, uas_eh_abort_handl=
er()
sends an overlapped tag for target_tag and clears the slot, aborting and
orphaning the new command.

Second, uas_dummy_sense() and uas_abort_complete() set
devinfo->cmnd[tag - 1] =3D NULL before uas_eh_abort_handler() kills
data_in_urb and data_out_urb, and the original sense URB in
devinfo->sense_urbs is never killed at all.  uas_queuecommand_lck() can
reassign the tag and stream ID to a new command while the old command's
data and sense URBs are still in flight, so when the old sense URB
completes in uas_stat_cmplt(), it looks up devinfo->cmnd[idx] by tag and
operates on the new command.

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
> +		/*
> +		 * if something woke us up the command
> +		 * has been cancelled.
> +		 * If we do take the timeout we have lost
> +		 * the race against the hardware or
> +		 * the hardware is broken. If the
> +		 * command succeeded we can count this
> +		 * as success. Otherwise we've failed.
> +		 *
> +		 * We will kill the URB later, thereby
> +		 * freeing the tag
> +		 */
> +		rv =3D schedule_timeout(HZ);
> +		if (rv)
> +			result =3D SUCCESS;
> +		else
> +			result =3D cmdinfo->cleanly_cancelled ? SUCCESS : FAILED;

[Severity: High]
Does checking `if (rv)` cause uas_eh_abort_handler() to return SUCCESS
when an abort URB fails?

schedule_timeout(HZ) returns the remaining jiffies (rv > 0) whenever woken
before the timeout expires.  Both the error path in uas_abort_complete()
and uas_dummy_sense() call wake_up_all(&cmdinfo->cancel) on any URB error
(such as -EPROTO, -EPIPE, or -ENOENT when killed) without setting
cmdinfo->cleanly_cancelled.  Because rv is non-zero, uas_eh_abort_handler()
reports SUCCESS to SCSI EH even though the abort failed.

> +		spin_lock_irq(&devinfo->lock);
> +		if (cmdinfo->state & DATA_IN_URB_INFLIGHT)
> +			data_in_urb =3D usb_get_urb(cmdinfo->data_in_urb);
> +		if (cmdinfo->state & DATA_OUT_URB_INFLIGHT)
> +			data_out_urb =3D usb_get_urb(cmdinfo->data_out_urb);
> +		spin_unlock_irq(&devinfo->lock);
> +	}

[Severity: High]
Does this branch leak unsubmitted URBs when usb_submit_urb(killer)
succeeds?

Setting COMMAND_ABORTED prevents uas_try_complete() from calling
uas_free_unsubmitted_urbs(cmnd), and unlike the admit_failure branch, this
branch never calls uas_free_unsubmitted_urbs(cmnd) either.  Any allocated
URBs that were not yet submitted (such as data_in_urb or data_out_urb on
USB 2.0 before READ_READY/WRITE_READY, or URBs queued on devinfo->work) are
leaked.  In addition, because neither uas_do_work() nor the
IU_ID_READ_READY/IU_ID_WRITE_READY handlers in uas_stat_cmplt() check
COMMAND_ABORTED, they can submit URBs for the aborted command after this
lock is dropped.

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

[Severity: High]
Does jumping to futile when devinfo->resetting is set leave the stack
waitqueue entry linked in cmdinfo->cancel and the task state set to
TASK_UNINTERRUPTIBLE?

set_current_state(TASK_UNINTERRUPTIBLE) and
add_wait_queue(&cmdinfo->cancel, &wait) run before checking
devinfo->resetting, while the futile label is placed after
set_current_state(TASK_RUNNING) and remove_wait_queue().  Taking the
futile jump returns from uas_eh_abort_handler() with stack-allocated wait
still on cmdinfo->cancel and current in TASK_UNINTERRUPTIBLE, and skips
setting COMMAND_ABORTED, freeing unsubmitted URBs, and killing in-flight
data URBs.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112133926.8784=
32-1-oneukum@suse.com?part=3D1
