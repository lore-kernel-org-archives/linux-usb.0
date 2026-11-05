Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793884108;
	b=WC6VkfP6DF4ZKVjnCCvs4IXBvy1UwXSCel93GB0N45GS7H5Erj/WD3jMy5U3OqOfJfZI
	 XoCaGEnQ3SQysnVFbwyGNyRinLkLhLcMY50yBLve7MeiaEmmhgNVVk9eu1gxsfo+4u1tH
	 aDUvgiBBBIiTws60noPwcFlf5bd7ZK5o+J1k42fvu0qysG977SMuOmS/dUKMcLdiTzOII
	 b6+99d8p1lIeQFA34z/tUrdvR8GGX42jvtbNaZm+uUDi+gy0L6qvX8q98QCG0jy/2YzUG
	 DHRaRpUxcUTqeP6LgvgILI7Ux6iiIRv5z70nylTvzLd09wjj7Du/PbovLNu6G64Xn9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793884108;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7C74/ERQ/bcwQcX71t+qj/sJ6Q1pZQooG2rPhS0zxdE=;
	b=RA+7asBQpXADmQFj0koJZVyFbITEmBM/+2omYWYfBo7ll6CkGIq0hhCo4TK8pKOyQ8ZK
	 RZOxB+YI8UN/fKKpB3OYa8pDNMeh1OK5FcJOwHZRlxqVr3iYgo2y05uDXnAtk+XjI/VKX
	 w7IF6TnY0Zo73ryyecfVD+ecgChexW59fSuS1ImmoeQjWM/IM2GMpP8N/wOdI7oJ79deL
	 hsOGyhXOYnp8Ry1W2k7iL5ss9L3XjFmLLm85UfgZaPtr9sUoNgiaTLS6DUuFa0CSmQ8JH
	 4u8s218TmPZE7vyZ4k2tROYYFdz3zjwZquVhr2PPA743QB+wK/uZjNqJ5qnx6NuGW/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MMB9fevj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395BA606A326
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 13:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MMB9fevj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 958991F000C1;
	Thu,  5 Nov 2026 13:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793884107;
	bh=7C74/ERQ/bcwQcX71t+qj/sJ6Q1pZQooG2rPhS0zxdE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MMB9fevjwZ/JNewaRqDoz1h16vfVk4/rJNz3ff9RpP2m7+RhLHBClkmw3jC+8I2te
	 CUq+guY4G+gLDcTagjkLbDDreGrlDuAWoTBtlrIS5LPlpfeAtCNR+co2yMFQeCFIYU
	 Isrq6FbAy1Djc+2nmS1hfOYdrMf/ptXaMvqZquXWrthjdH/yxf0NJPpKiFh5imM7ig
	 jr4LQ4wwM56Uy4k5vlk0smwp6j8qb9rByQfCcgf+2daFobmBDfiT8nl5NLrW65yPjH
	 PjMVed5XRirI1oRp1iywccFLVWBy95EshcFhYcA6mBrhrSAE4dJpUzKKbGVvjpsmDH
	 +wMmFFP3a6wfg==
Message-ID: <sashiko-outbox-199121@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC]preliminary support for eh_abort_handler
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oliver Neukum" <oneukum@suse.com>
Cc: "USB list" <linux-usb@vger.kernel.org>
In-Reply-To: <4fdff241-7092-4013-8af1-89ceb85f2b14@suse.com>
References: <4fdff241-7092-4013-8af1-89ceb85f2b14@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 13:08:27 +0000
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
- [Critical] uas: NULL dereference of cmdinfo->killer in uas_abort_complete=
()
- [Critical] uas: premature tag release and racing URB submissions during a=
bort
- [Critical] uas: double free and wrong-tag abort in uas_eh_abort_handler()
- [High] uas: duplicate status URB in uas_abort_complete() conflicts with s=
ense URB
- [High] uas: URB unlink statuses treated as success in abort callbacks
- [High] uas: remove_wait_queue() on unadded entry in uas_eh_abort_handler()
- [Medium] uas: memory leak of dummy buffer in uas_abort_complete() on subm=
it error
- [Medium] uas: missing uas_free_unsubmitted_urbs() in uas_eh_abort_handler=
()
- [Medium] uas: premature TASK_UNINTERRUPTIBLE before lock and printk in ab=
ort
--

commit 011b29f56a91695e69452114ed53025593de9c85
Author: Oliver Neukum <oneukum@suse.com>

preliminary support for eh_abort_handler

This commit implements uas_eh_abort_handler() by sending a duplicate
TEST_UNIT_READY command with the same tag as the command being aborted to
trigger an overlapped-tag error on the target.

> diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
> index 8655edbd66b16..d7421bf82209e 100644
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

[Severity: Critical]
Can this cause a double free of unsubmitted URBs or abort a newly queued
command if a command completes or is zapped before or during
uas_eh_abort_handler()?

Before uas_eh_abort_handler() acquires devinfo->lock (including while
usb_alloc_urb(0, GFP_NOIO) runs), cmnd may have already completed via
uas_try_complete() or been zapped by uas_zap_pending() during
uas_disconnect() or uas_eh_host_reset_handler().

In uas_try_complete(), devinfo->cmnd[cmdinfo->uas_tag - 1] is cleared to
NULL and uas_free_unsubmitted_urbs(cmnd) frees cmdinfo->cmd_urb,
cmdinfo->data_in_urb, and cmdinfo->data_out_urb without clearing those
pointers:

static int uas_try_complete(struct scsi_cmnd *cmnd, const char *caller)
{
	...
	devinfo->cmnd[cmdinfo->uas_tag - 1] =3D NULL;
	uas_free_unsubmitted_urbs(cmnd);
	scsi_done(cmnd);
	return 0;
}

Because uas_eh_abort_handler() does not check devinfo->resetting or verify
that devinfo->cmnd[target_tag - 1] =3D=3D cmnd after acquiring devinfo->loc=
k,
if killer URB submission fails and jumps to admit_failure,
uas_eh_abort_handler() calls uas_free_unsubmitted_urbs(cmnd) a second time
on the dangling URB pointers.

Additionally, if target_tag was already reallocated to a new command by
uas_queuecommand_lck(), uas_eh_abort_handler() will send a duplicate-tag
command for target_tag and clear devinfo->cmnd[target_tag - 1], aborting
and corrupting the new command. Likewise, if uas_zap_pending() runs while
uas_eh_abort_handler() is sleeping in schedule_timeout(HZ), clearing
COMMAND_ABORTED here allows uas_zap_pending() to call uas_try_complete() on
cmnd while uas_eh_abort_handler() is still operating on it.

[ ... ]
> @@ -730,35 +738,182 @@ static enum scsi_qc_status uas_queuecommand_lck(st=
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

[Severity: Critical]
Does clearing devinfo->cmnd[tag - 1] here and in uas_abort_complete() race
with in-flight and late-submitted data URBs?

scmd_eh_abort_handler() invokes uas_eh_abort_handler() while the Scsi_Host
is still in SHOST_RUNNING, so uas_queuecommand_lck() can run concurrently
on another CPU. When uas_dummy_sense() or uas_abort_complete() sets
devinfo->cmnd[tag - 1] =3D NULL before uas_eh_abort_handler() wakes up and
kills data_in_urb and data_out_urb (and also on bailout or admit_failure
when the target may still be executing the command on that tag), a new
command in uas_queuecommand_lck() can immediately allocate tag - 1 and
submit URBs on the same stream_id while the aborted command's URBs are
still active.

Conversely, while devinfo->cmnd[tag - 1] remains non-NULL during
schedule_timeout(HZ) (and on timeout, even after uas_eh_abort_handler()
checks DATA_IN_URB_INFLIGHT and DATA_OUT_URB_INFLIGHT before
usb_kill_urb(killer) triggers the completion callback that clears
devinfo->cmnd[tag - 1]), neither uas_do_work() nor uas_stat_cmplt() (when
receiving IU_ID_READ_READY or IU_ID_WRITE_READY) checks COMMAND_ABORTED:

static void uas_do_work(struct work_struct *work)
{
	...
		if (!(cmdinfo->state & IS_IN_WORK_LIST))
			continue;

		err =3D uas_submit_urbs(cmnd, cmnd->device->hostdata);
	...
}

Can uas_do_work() or uas_stat_cmplt() -> uas_xfer_data() submit
data_in_urb or data_out_urb after uas_eh_abort_handler() has already
checked DATA_IN_URB_INFLIGHT and DATA_OUT_URB_INFLIGHT, leaving active data
URBs with urb->context =3D cmnd in flight after uas_eh_abort_handler()
returns?

> +	switch (status) {
> +	case -ESHUTDOWN:
> +	case -ENOENT:
> +	case -ECONNRESET:
> +	case 0:
> +		cmdinfo->cleanly_cancelled =3D 1;
> +		break;
> +	}

[Severity: High]
Should -ESHUTDOWN, -ENOENT, and -ECONNRESET really be treated as successful
completions in uas_dummy_sense() and uas_abort_complete()?

Those status codes indicate that the URB was unlinked or killed on the host
side (for example via usb_kill_urb(killer) on timeout in
uas_eh_abort_handler(), or via usb_kill_anchored_urbs(&devinfo->killer_urbs)
in uas_eh_host_reset_handler() and uas_disconnect()), not that the target
responded.

In uas_dummy_sense(), setting cmdinfo->cleanly_cancelled =3D 1 on unlink
means that if usb_kill_anchored_urbs(&devinfo->killer_urbs) kills the URB
while uas_eh_abort_handler() has remaining timeout (rv > 0),
uas_eh_abort_handler() will wake up and return SUCCESS even though the
abort URB was killed rather than completed.

In uas_abort_complete(), grouping -ECONNRESET, -ESHUTDOWN, and -ENOENT with
case 0 causes a killed command-pipe URB to allocate dummy and resubmit
cmdinfo->killer onto devinfo->status_pipe instead of bailing out.

> +	spin_unlock_irqrestore(&devinfo->lock, flags);
> +
> +	kfree(u->transfer_buffer);
> +	wake_up_all(&cmdinfo->cancel);
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
> +bailout:
> +		spin_lock_irqsave(&devinfo->lock, flags);
> +		devinfo->cmnd[tag - 1] =3D NULL;
> +		spin_unlock_irqrestore(&devinfo->lock, flags);
> +		wake_up_all(&cmdinfo->cancel);
> +		break;
> +	case 0:
> +	case -ECONNRESET:
> +	case -ESHUTDOWN:
> +	case -ENOENT:
> +		kfree(u->transfer_buffer);
> +		dummy =3D kzalloc(sizeof(*dummy), GFP_ATOMIC);
> +		if (!dummy)
> +			goto bailout;
> +		usb_fill_bulk_urb(cmdinfo->killer, udev, devinfo->status_pipe,
> +				dummy, sizeof(*dummy), uas_dummy_sense, cmnd);
> +		spin_lock_irqsave(&devinfo->lock, flags);
> +		if (devinfo->use_streams)
> +			cmdinfo->killer->stream_id =3D cmdinfo->uas_tag;
> +		usb_anchor_urb(u, &devinfo->killer_urbs);
> +		rv =3D usb_submit_urb(cmdinfo->killer, GFP_ATOMIC);

[Severity: High]
How does submitting cmdinfo->killer on devinfo->status_pipe interact with
the sense URB that was already submitted for this command in
uas_submit_urbs() -> uas_submit_sense_urb()?

When cmnd was originally queued, uas_submit_sense_urb() already queued a
sense URB (with completion callback uas_stat_cmplt()) on
devinfo->status_pipe for this stream_id. When the duplicate TEST_UNIT_READY
triggers an overlapped tag error, the target sends a single IU_ID_RESPONSE
(RC_OVERLAPPED_TAG). Because URBs on the same pipe/stream complete in FIFO
order, that Response IU will be received by the original sense URB at the
head of the queue in uas_stat_cmplt(), where uas_try_complete() sees
COMMAND_ABORTED and returns -EBUSY without waking cmdinfo->cancel:

	case IU_ID_RESPONSE:
		cmdinfo->state &=3D ~COMMAND_INFLIGHT;
		success =3D uas_evaluate_response_iu((struct response_iu *)iu, cmnd);
		if (!success) {
			/* Error, cancel data transfers */
			data_in_urb =3D usb_get_urb(cmdinfo->data_in_urb);
			data_out_urb =3D usb_get_urb(cmdinfo->data_out_urb);
		}
		uas_try_complete(cmnd, __func__);
		break;

Meanwhile, cmdinfo->killer is queued behind the original sense URB waiting
for a second status IU that never arrives, so schedule_timeout(HZ) in
uas_eh_abort_handler() will time out and return FAILED, while leaving the
original sense URB dangling on devinfo->sense_urbs if it did not complete.

Also, if the original command finished just before the duplicate
TEST_UNIT_READY arrived, the target will execute TEST_UNIT_READY and return
a Sense IU (at least 16 bytes) into dummy, which is only
sizeof(struct response_iu) (8 bytes), causing -EOVERFLOW. And on USB 2.0
(!devinfo->use_streams), queuing cmdinfo->killer with uas_dummy_sense() on
the shared status_pipe without checking iu->tag or iu->iu_id can consume
the next status or ready IU belonging to an unrelated command on another
tag.

> +		spin_unlock_irqrestore(&devinfo->lock, flags);
> +		if (rv < 0) {
> +			usb_unanchor_urb(u);
> +			goto bailout;
> +		}

[Severity: Medium]
If usb_submit_urb(cmdinfo->killer, GFP_ATOMIC) fails here (rv < 0), does
jumping to bailout leak the newly allocated dummy buffer?

The bailout label is placed after kfree(u->transfer_buffer), and
uas_eh_abort_handler() only calls usb_kill_urb(killer) and
usb_free_urb(killer) without freeing killer->transfer_buffer.

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
> +	spin_lock_irq(&devinfo->lock);

[Severity: Medium]
Is it safe to call set_current_state(TASK_UNINTERRUPTIBLE) before
spin_lock_irq(&devinfo->lock), uas_log_cmd_state(), and add_wait_queue()?

uas_log_cmd_state() calls scmd_printk() and scsi_print_command(), and on
PREEMPT_RT spin_lock_irq() acquires a sleeping rt_mutex. Calling these with
current->__state set to TASK_UNINTERRUPTIBLE can trigger might_sleep()
warnings and reset current->__state back to TASK_RUNNING before
schedule_timeout(HZ) is reached, causing schedule_timeout(HZ) to return
immediately with rv > 0 while cmdinfo->cleanly_cancelled is still 0.

> +	target_tag =3D cmdinfo->uas_tag;
> =20
>  	/* Ensure that try_complete does not call scsi_done */
>  	cmdinfo->state |=3D COMMAND_ABORTED;
> =20
> -	/* Drop all refs to this cmnd, kill data urbs to break their ref */
> -	devinfo->cmnd[cmdinfo->uas_tag - 1] =3D NULL;
> -	if (cmdinfo->state & DATA_IN_URB_INFLIGHT)
> -		data_in_urb =3D usb_get_urb(cmdinfo->data_in_urb);
> -	if (cmdinfo->state & DATA_OUT_URB_INFLIGHT)
> -		data_out_urb =3D usb_get_urb(cmdinfo->data_out_urb);
> +	if (!killer)
> +		goto admit_failure;
> +	cmdinfo->killer =3D killer;
> +	bullet =3D allocate_double_command(target_tag, cmnd->device);
> +	if (!bullet)
> +		goto admit_failure;
> =20
> -	uas_free_unsubmitted_urbs(cmnd);
> +	usb_fill_bulk_urb(killer, udev, devinfo->cmd_pipe,
> +			bullet, sizeof(*bullet), uas_abort_complete, cmnd);
> +	uas_log_cmd_state(cmnd, __func__, 0);
> =20
> -	spin_unlock_irqrestore(&devinfo->lock, flags);
> +	cmdinfo->killer =3D killer;
> +	add_wait_queue(&cmdinfo->cancel, &wait);
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
> +
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

[Severity: Medium]
Does the else branch here leak unsubmitted URBs by omitting
uas_free_unsubmitted_urbs(cmnd)?

Because COMMAND_ABORTED is set on cmdinfo->state, uas_try_complete()
returns -EBUSY without calling uas_free_unsubmitted_urbs(cmnd), and
devinfo->cmnd[tag - 1] is cleared to NULL by the abort callbacks. When
usb_submit_urb(killer, GFP_ATOMIC) succeeds, any allocated but unsubmitted
URBs (such as data_in_urb or data_out_urb on USB 2.0 before
IU_ID_READ_READY or IU_ID_WRITE_READY arrives, or URBs pending on
devinfo->work) are never freed.

> +	set_current_state(TASK_RUNNING);
> +	remove_wait_queue(&cmdinfo->cancel, &wait);

[Severity: High]
What happens in remove_wait_queue(&cmdinfo->cancel, &wait) if killer or
bullet allocation failed earlier?

When !killer or !bullet jumps to admit_failure, add_wait_queue() is
skipped, leaving wait.entry.next and wait.entry.prev as NULL. Calling
remove_wait_queue(&cmdinfo->cancel, &wait) unconditionally here will
dereference NULL in list_del(&wait.entry).

> +	/*
> +	 * we know a callback will free the tag
> +	 */
> +	spin_lock_irq(&devinfo->lock);
> +	cmdinfo->killer =3D NULL;
> +	spin_unlock_irq(&devinfo->lock);
> +	usb_kill_urb(killer);

[Severity: Critical]
Can setting cmdinfo->killer =3D NULL before usb_kill_urb(killer) cause a NU=
LL
pointer dereference in uas_abort_complete()?

If schedule_timeout(HZ) times out while the first-stage killer URB is still
in flight on devinfo->cmd_pipe (or completing concurrently on another CPU),
cmdinfo->killer is set to NULL here and then usb_kill_urb(killer) unlinks
the URB with status -ENOENT and waits for uas_abort_complete() to finish.

In uas_abort_complete(), both status =3D=3D 0 and status =3D=3D -ENOENT ent=
er the
resubmit path and dereference cmdinfo->killer without checking if it is
NULL:

	case 0:
	case -ECONNRESET:
	case -ESHUTDOWN:
	case -ENOENT:
		kfree(u->transfer_buffer);
		dummy =3D kzalloc(sizeof(*dummy), GFP_ATOMIC);
		if (!dummy)
			goto bailout;
		usb_fill_bulk_urb(cmdinfo->killer, udev, devinfo->status_pipe,
				dummy, sizeof(*dummy), uas_dummy_sense, cmnd);
		spin_lock_irqsave(&devinfo->lock, flags);
		if (devinfo->use_streams)
			cmdinfo->killer->stream_id =3D cmdinfo->uas_tag;
		usb_anchor_urb(u, &devinfo->killer_urbs);
		rv =3D usb_submit_urb(cmdinfo->killer, GFP_ATOMIC);

Wouldn't usb_fill_bulk_urb(cmdinfo->killer, ...) immediately dereference
NULL?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/4fdff241-7092-4013-=
8af1-89ceb85f2b14@suse.com?part=3D1
