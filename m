Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793808816;
	b=lk+5K/VDJk6Hwnl6Fx2oHHQsai/d282Z+1aFfx+/qnwS6AXCsVoMKoV6QLZVQG/CaoAW
	 qxqXmB9N2Gv0yqGma4doRK5G4CVrUyibEYkJr2b2fmMtBXsNcKQlDrbv9UOsSRzAGrvlp
	 h36VP+DeKyhluGzn8wJUKs6aAappVmS5BdtRCHJoAh1BzFN1bTP85Ta01Zg821Qb+aSrM
	 Usihy+i31+DWuV3PN7S9l3opiPx5tO036EqJmx37e19XW+R4Zq1H/7inr5MuUDTmU/nUg
	 NakuVg2R3e+rkvyrNlCPdzJB90jEJ/JZuNJKxPZ/Q0SE7/Gnyvf9YQxf7C6us+Cj6rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808816;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=gxdTp+x749IY/dDp+g4yvvKHx9LufklMtPYhVlolZEc=;
	b=hW6c7xwVLLGvCpYjOgWMMwSBjFrDr6Iylu/llmnbc67gM+Fz04f96EaWJiVWQGSpnUjP
	 3ifhZETapj7rO5+wP2hPyVmKbGelcvQ/j/Hz64ldb1aKXV3RZf6ywWnfrwaAbplEDCfIZ
	 Z1S6vPmOqd/Sp2xHo7pDOZeMPuPGPOr4Gbi6mOsp0dv1vstjXrjSLRtT14jhTM8iWmIX6
	 EAiRPxnf3O6umqay646nKVcfRRujZBNWybLYUxjtYBuMY+laqvHFIJ9ntZ/HvIXcheAJK
	 UW4pbNotgi5jIkhGvVXBlcQ8L8St7/IB82OMdfIYRl3OgDXdAcfQ51WvQQik/2jIs2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BMeycloO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D20F606A32E
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 16:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BMeycloO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 503AF1F00919;
	Wed,  4 Nov 2026 16:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793808815;
	bh=gxdTp+x749IY/dDp+g4yvvKHx9LufklMtPYhVlolZEc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BMeycloO1urBvkKLsMI4hQydUI4ETMZhrtUZmeuEvniQ0K3JxYgWd8PlpVvGLLD0j
	 hERq//Brqr+ylFHzT88Xg01WCldYRMg4HjwHaGIFZ7SG+IzBBPXV52jHYS1H5NvFBQ
	 EqNDtJYPtB2bW+fhdPceA5vKK6kdEoATfJIGdvPHyiKhKbAQY+ljT6IGdEKPuVtUzZ
	 nuVYKMmiv7WdzRGwgzJRg+Iywx4BTCMGvHMjrJqBGxSjOB1BaZ2neh1H4UozuCx3uC
	 2Re9erLsrQ8ts78Kps9cWZF5wupJCZvVGzXRc8LwS80pDfa1F2V/zxD8xyE/+RefIv
	 zw2xULZr1L6Qg==
Message-ID: <sashiko-outbox-197588@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFC]alpha implementation of eh_abort_handler for UAS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oliver Neukum" <oneukum@suse.com>
Cc: "USB list" <linux-usb@vger.kernel.org>
In-Reply-To: <e3eb3c84-ea19-4502-976e-eeb83e80a92c@suse.com>
References: <e3eb3c84-ea19-4502-976e-eeb83e80a92c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 16:13:34 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 13 potential issue=
(s) to consider:
- [Critical] usb: uas: kfree() of uninitialized pointer in uas_eh_abort_han=
dler()
- [Critical] usb: uas: double free of dummy buffer in uas_abort_complete()
- [Critical] usb: uas: unkilled data URBs and leaked URBs in uas_eh_abort_h=
andler()
- [Critical] uas: missing remove_wait_queue() for stack wait entry in uas_e=
h_abort_handler()
- [Critical] uas: premature tag slot clearing in uas_dummy_sense() and uas_=
abort_complete()
- [High] usb: uas: off-by-one tag passed to allocate_double_command()
- [High] usb: uas: invalid Additional CDB Length in allocate_double_command=
()
- [High] usb: uas: response IU URB submitted to cmd_pipe in uas_abort_compl=
ete()
- [High] usb: uas: non-zero stream_id set on cmd_pipe in uas_eh_abort_handl=
er()
- [High] uas: deadlock calling usb_unlink_urb() under lock in uas_evaluate_=
response_iu()
- [High] uas: race and UAF on cmdinfo->killer in uas_evaluate_response_iu()
- [High] uas: WARN_ON in uas_zap_pending() and missing state checks during =
abort
- [Low] uas: C11 label-before-declaration and duplicate assignments in abor=
t path
--

commit 65c1aae6f67a03edcc9d2b5225d49392e26bfdb6
Author: Oliver Neukum <oneukum@suse.com>

alpha implementation of eh_abort_handler for UAS

This commit implements uas_eh_abort_handler() in drivers/usb/storage/uas.c =
by
submitting a duplicate TEST_UNIT_READY command IU reusing the timed-out
command's tag to force an overlapped tag response.

> diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
> index 8655edbd66b16..45182df35a7bb 100644
> --- a/drivers/usb/storage/uas.c
> +++ b/drivers/usb/storage/uas.c
[ ... ]
> @@ -286,6 +289,12 @@ static bool uas_evaluate_response_iu(struct response=
_iu *riu, struct scsi_cmnd *
>  	case RC_TMF_NOT_SUPPORTED:
>  		set_host_byte(cmnd, DID_BAD_TARGET);
>  		break;
> +	case RC_OVERLAPPED_TAG:
> +		struct uas_cmd_info *cmdinfo =3D scsi_cmd_priv(cmnd);
> +
> +		usb_unlink_urb(cmdinfo->killer);
> +		set_host_byte(cmnd, DID_ABORT);
> +		break;

[Severity: Low]
In uas_evaluate_response_iu(), placing the declaration of cmdinfo directly
after the case RC_OVERLAPPED_TAG label without enclosing braces is not
valid in gnu11. Could this case block be wrapped in braces (or cmdinfo
moved to the top of the function) so it builds cleanly?

[Severity: High]
Can calling usb_unlink_urb(cmdinfo->killer) here in
uas_stat_cmplt() -> uas_evaluate_response_iu() deadlock on devinfo->lock?

uas_stat_cmplt() holds devinfo->lock while calling
uas_evaluate_response_iu(). On HCDs or dequeue paths that give back the URB
synchronously during usb_unlink_urb(), the completion handler
uas_abort_complete() or uas_dummy_sense() will immediately try to acquire
devinfo->lock and deadlock.

[Severity: High]
How is cmdinfo->killer synchronized between uas_evaluate_response_iu(),
uas_abort_complete(), and uas_eh_abort_handler()?

First, if RC_OVERLAPPED_TAG arrives on the original status URB while the
stage-1 command URB is still in flight, usb_unlink_urb(cmdinfo->killer)
unlinks stage 1, causing uas_abort_complete() to see a negative status
(-ECONNRESET) and jump to bailout without setting cleanly_cancelled. If it
arrives while uas_abort_complete() is between stage-1 completion and
stage-2 submission, usb_unlink_urb() races with unlocked usb_fill_bulk_urb()
and fails on the inactive URB before stage 2 is submitted.

Second, in uas_eh_abort_handler(), if allocate_double_command() fails after
setting cmdinfo->killer =3D killer (or if schedule_timeout(HZ) returns befo=
re
devinfo->cmnd[tag - 1] is cleared), usb_free_urb(killer) frees the URB
without clearing cmdinfo->killer under devinfo->lock. If an
RC_OVERLAPPED_TAG response arrives afterward in uas_stat_cmplt(), won't
uas_evaluate_response_iu() pass a freed cmdinfo->killer pointer to
usb_unlink_urb()?

[ ... ]
> @@ -730,35 +740,167 @@ static enum scsi_qc_status uas_queuecommand_lck(st=
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
> -static int uas_eh_abort_handler(struct scsi_cmnd *cmnd)
> +
> +#define SIMPLE_TUR_LENGTH 6
> +static struct command_iu *allocate_double_command(int tag, struct scsi_d=
evice *sdev)
>  {
> +	struct command_iu *test_unit_ready;
> +
> +	test_unit_ready =3D kzalloc(sizeof(*test_unit_ready), GFP_ATOMIC);
> +	if (!test_unit_ready)
> +		return NULL;
> +
> +	test_unit_ready->iu_id =3D IU_ID_COMMAND;
> +	test_unit_ready->tag =3D cpu_to_be16(tag);
> +	test_unit_ready->prio_attr =3D UAS_SIMPLE_TAG;
> +	test_unit_ready->len =3D SIMPLE_TUR_LENGTH;

[Severity: High]
In struct command_iu, doesn't the len field specify the additional CDB
length beyond the 16-byte cdb[16] array rather than the total CDB length?

In uas_alloc_cmd_urb(), len is computed as cmnd->cmd_len - 16 (clamped to 0
for CDBs of 16 bytes or less):

	int len =3D cmnd->cmd_len - 16;
	...
	if (len < 0)
		len =3D 0;
	len =3D ALIGN(len, 4);
	iu->len =3D len;

For a 6-byte TEST_UNIT_READY CDB where sizeof(*bullet) (32 bytes) is
submitted, setting test_unit_ready->len =3D 6 tells the UAS target to expec=
t 6
extra CDB bytes beyond the 32-byte IU. Shouldn't test_unit_ready->len be 0?

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
>  	struct uas_cmd_info *cmdinfo =3D scsi_cmd_priv(cmnd);
>  	struct uas_dev_info *devinfo =3D (void *)cmnd->device->hostdata;
> -	struct urb *data_in_urb =3D NULL;
> -	struct urb *data_out_urb =3D NULL;
> +	int tag =3D cmdinfo->uas_tag;
>  	unsigned long flags;
> +	/*
> +	 * An error implies success
> +	 */
> +	int status =3D u->status;
> =20
> +	/*
> +	 * The tag must be freed in every case
> +	 */
>  	spin_lock_irqsave(&devinfo->lock, flags);
> +	devinfo->cmnd[tag - 1] =3D NULL;
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
> +	wake_up_all(&cmdinfo->cancel);
> +}

[Severity: Critical]
Is it safe for uas_dummy_sense() (and the bailout path in
uas_abort_complete()) to clear devinfo->cmnd[tag - 1] =3D NULL while the
aborted command's original status and data URBs may still be active?

Once devinfo->cmnd[tag - 1] is NULL, uas_queuecommand_lck() can immediately
reassign that tag and stream ID to a newly queued scsi_cmnd. If the aborted
command's status or RC_OVERLAPPED_TAG response arrives afterward in
uas_stat_cmplt(), devinfo->cmnd[idx] will either point to the new command
(aborting or completing the wrong command) or be NULL (causing
uas_stat_cmplt() to return early without unlinking the aborted command's
data URBs).

Also, in uas_dummy_sense(), won't setting cleanly_cancelled =3D 1 on status=
 0,
-ENOENT (from usb_kill_urb()), and -ESHUTDOWN report a successful abort even
when no RC_OVERLAPPED_TAG unlink (-ECONNRESET) occurred?

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
> +	if (status < 0) {
> +		/*
> +		 * immediate cleanup
> +		 */
> +		kfree(u->transfer_buffer);
> +bailout:
> +		spin_lock_irqsave(&devinfo->lock, flags);
> +		devinfo->cmnd[tag - 1] =3D NULL;
> +		spin_unlock_irqrestore(&devinfo->lock, flags);
> +		wake_up_all(&cmdinfo->cancel);
> +	} else {
> +		kfree(u->transfer_buffer);
> +		dummy =3D kzalloc(sizeof(*dummy), GFP_ATOMIC);
> +		if (!dummy)
> +			goto bailout;
> +		usb_fill_bulk_urb(cmdinfo->killer, udev, devinfo->cmd_pipe,
> +				dummy, sizeof(*dummy), uas_dummy_sense, cmnd);

[Severity: High]
In uas_abort_complete(), is devinfo->cmd_pipe intended here when submitting
the URB for struct response_iu *dummy?

devinfo->cmd_pipe is the Bulk OUT command pipe, whereas status and response
IUs are received on devinfo->status_pipe (Bulk IN). Submitting dummy to
devinfo->cmd_pipe sends 8 zero bytes OUT to the command endpoint, which
completes immediately with status =3D=3D 0 and triggers uas_dummy_sense() to
set cleanly_cancelled =3D 1 before the device sends a response.

> +		cmdinfo->killer->transfer_flags |=3D URB_FREE_BUFFER;
> +		spin_lock_irqsave(&devinfo->lock, flags);
> +		if (devinfo->use_streams)
> +			cmdinfo->killer->stream_id =3D cmdinfo->uas_tag;
> +		rv =3D usb_submit_urb(cmdinfo->killer, GFP_ATOMIC);
> +		spin_unlock_irqrestore(&devinfo->lock, flags);
> +		if (rv < 0) {
> +			kfree (dummy);
> +			goto bailout;
> +		}

[Severity: Critical]
If usb_submit_urb(cmdinfo->killer, GFP_ATOMIC) fails in
uas_abort_complete(), won't dummy be double-freed?

cmdinfo->killer->transfer_buffer is set to dummy and URB_FREE_BUFFER is set
in transfer_flags. When rv < 0, kfree(dummy) frees the buffer immediately,
and then uas_eh_abort_handler() calls usb_free_urb(killer), where
urb_destroy() sees URB_FREE_BUFFER still set and calls
kfree(urb->transfer_buffer) a second time.

> +	}
> +}
> +
> +static int uas_eh_abort_handler(struct scsi_cmnd *cmnd)
> +{
> +	DECLARE_WAITQUEUE(wait, current);
> +	struct uas_cmd_info *cmdinfo =3D scsi_cmd_priv(cmnd);
> +	struct uas_dev_info *devinfo =3D (void *)cmnd->device->hostdata;
> +	struct usb_device *udev =3D devinfo->udev;
> +	struct urb *data_in_urb =3D NULL;
> +	struct urb *data_out_urb =3D NULL;
> +	struct urb *killer;
> +	struct command_iu *bullet;
> +	int target_tag, rv;
> +	int result =3D FAILED;
> +
> +	killer =3D usb_alloc_urb(0, GFP_NOIO);
> +
> +	set_current_state(TASK_UNINTERRUPTIBLE);
> +	spin_lock_irq(&devinfo->lock);
> +	target_tag =3D cmdinfo->uas_tag - 1;
> +	if (!killer)
> +		goto admit_failure;
> +	cmdinfo->killer =3D killer;
> +	bullet =3D allocate_double_command(target_tag, cmnd->device);
> +	if (!bullet)
> +		goto admit_failure;

[Severity: Critical]
If usb_alloc_urb() returns NULL in uas_eh_abort_handler(), doesn't jumping
to admit_failure pass an uninitialized bullet pointer to kfree(bullet)?

Also, if either !killer or !bullet jumps to admit_failure, it skips setting
cmdinfo->state |=3D COMMAND_ABORTED before calling
uas_free_unsubmitted_urbs(cmnd) and killing the data URBs. Without
COMMAND_ABORTED set, won't a racing URB completion in uas_try_complete()
call uas_free_unsubmitted_urbs(cmnd) a second time and invoke
scsi_done(cmnd)?

[Severity: High]
Isn't target_tag off by one when passed to allocate_double_command() in
uas_eh_abort_handler()?

In uas_queuecommand_lck(), cmdinfo->uas_tag is 1-based (idx + 1), and
uas_alloc_cmd_urb() writes cpu_to_be16(cmdinfo->uas_tag) into iu->tag. Here,
target_tag is computed as cmdinfo->uas_tag - 1 (the 0-based devinfo->cmnd[]
index) and passed to allocate_double_command(target_tag, cmnd->device),
which sets test_unit_ready->tag =3D cpu_to_be16(tag). Won't this send tag 0
when aborting uas_tag 1, or abort the wrong in-flight command (uas_tag - 1)
for any uas_tag > 1?

> +
> +	usb_fill_bulk_urb(killer, udev, devinfo->cmd_pipe,
> +			bullet, sizeof(*bullet), uas_abort_complete, cmnd);
> +	if (devinfo->use_streams)
> +		killer->stream_id =3D cmdinfo->uas_tag;

[Severity: High]
Should killer->stream_id be set when submitting to devinfo->cmd_pipe?

In uas_configure_endpoints(), streams are only allocated on status_pipe,
data_in_pipe, and data_out_pipe (eps + 1), while the command endpoint
(eps[0]) does not use streams and uas_alloc_cmd_urb() leaves stream_id as 0.
Won't setting a non-zero stream_id on devinfo->cmd_pipe here (and in
uas_abort_complete() if cmd_pipe is used) fail or misbehave on xHCI?

>  	uas_log_cmd_state(cmnd, __func__, 0);
> =20
>  	/* Ensure that try_complete does not call scsi_done */
>  	cmdinfo->state |=3D COMMAND_ABORTED;
> +	target_tag =3D cmdinfo->uas_tag - 1;
> +	cmdinfo->killer =3D killer;

[Severity: High]
What happens if uas_disconnect() or uas_eh_host_reset_handler() runs while
uas_eh_abort_handler() has set COMMAND_ABORTED and dropped devinfo->lock to
sleep in schedule_timeout(HZ)?

Because devinfo->cmnd[cmdinfo->uas_tag - 1] remains non-NULL while sleeping,
uas_zap_pending() will call uas_try_complete(cmnd, __func__), which returns
-EBUSY when COMMAND_ABORTED is set and triggers WARN_ON(err !=3D 0) in
uas_zap_pending():

	cmdinfo->state &=3D ~COMMAND_INFLIGHT;
	cmnd->result =3D result << 16;
	err =3D uas_try_complete(cmnd, __func__);
	WARN_ON(err !=3D 0);

In addition, should uas_eh_abort_handler() check after acquiring
devinfo->lock whether devinfo->resetting is set or whether
devinfo->cmnd[cmdinfo->uas_tag - 1] !=3D cmnd (in case the command already
completed before devinfo->lock was taken)?

Also, this isn't a bug, but target_tag =3D cmdinfo->uas_tag - 1 and
cmdinfo->killer =3D killer are duplicated here after already being assigned
earlier in uas_eh_abort_handler().

> +	add_wait_queue(&cmdinfo->cancel, &wait);
> +
> +	rv =3D usb_submit_urb(killer, GFP_ATOMIC);

[Severity: Critical]
In uas_eh_abort_handler(), wait is declared on the stack with
DECLARE_WAITQUEUE(wait, current) and added to cmdinfo->cancel via
add_wait_queue(&cmdinfo->cancel, &wait), but remove_wait_queue() is never
called before returning. Won't this leave a dangling stack pointer linked in
cmdinfo->cancel after uas_eh_abort_handler() returns?

> +	if (rv < 0) {
> +admit_failure:
> +		/* Drop all refs to this cmnd, kill data urbs to break their ref */
> +		devinfo->cmnd[cmdinfo->uas_tag - 1] =3D NULL;
> +		if (cmdinfo->state & DATA_IN_URB_INFLIGHT)
> +			data_in_urb =3D usb_get_urb(cmdinfo->data_in_urb);
> +		if (cmdinfo->state & DATA_OUT_URB_INFLIGHT)
> +			data_out_urb =3D usb_get_urb(cmdinfo->data_out_urb);
> =20
> -	/* Drop all refs to this cmnd, kill data urbs to break their ref */
> -	devinfo->cmnd[cmdinfo->uas_tag - 1] =3D NULL;
> -	if (cmdinfo->state & DATA_IN_URB_INFLIGHT)
> -		data_in_urb =3D usb_get_urb(cmdinfo->data_in_urb);
> -	if (cmdinfo->state & DATA_OUT_URB_INFLIGHT)
> -		data_out_urb =3D usb_get_urb(cmdinfo->data_out_urb);
> -
> -	uas_free_unsubmitted_urbs(cmnd);
> -
> -	spin_unlock_irqrestore(&devinfo->lock, flags);
> +		uas_free_unsubmitted_urbs(cmnd);
> +		spin_unlock_irq(&devinfo->lock);
> +		kfree(bullet);
> +	} else {
> +		spin_unlock_irq(&devinfo->lock);
> +		rv =3D schedule_timeout(HZ);
> +		if (rv)
> +			result =3D cmdinfo->cleanly_cancelled ? SUCCESS : FAILED;
> +	}

[Severity: Critical]
When usb_submit_urb(killer, GFP_ATOMIC) succeeds and takes the else branch
in uas_eh_abort_handler(), data_in_urb and data_out_urb are never collected
from cmdinfo and uas_free_unsubmitted_urbs(cmnd) is never called.

Because COMMAND_ABORTED is set, uas_try_complete() returns -EBUSY and will
not free unsubmitted URBs either, leaking any allocated-but-unsubmitted
cmd_urb or data URBs. More importantly, when uas_eh_abort_handler() exits
without killing in-flight data_in_urb or data_out_urb (and without stopping
uas_do_work() from submitting pending URBs if IS_IN_WORK_LIST is set), won't
those data URBs continue DMA and access cmnd in uas_data_cmplt() after the
SCSI error handler has freed or reused the command?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/e3eb3c84-ea19-4502-=
976e-eeb83e80a92c@suse.com?part=3D1
