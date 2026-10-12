Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A69495AE5
	for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2026 16:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820999; cv=none; b=WGwvfEho3oOqvl38JLmMvq5nPXRMS0HAxFuwtvjFnZoW1vltMT98kv4Z7cm2pAUIxsOq+RpQlNCdUhSSJ633JFjVDOk8B3XPpAKo9LDYnsl0j0Gq5jy+trEK/H7va4PBdg0xOXp87URMvs3Y8RfXyeC1z9/SoAIXgQNIjsMb2us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820999; c=relaxed/simple;
	bh=zuYJxbWb0Z6QcKQSBpStLxukfVnKdnKJKrWHBJwyOTk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=puz+i4OVqkVfU5K5y1AUpZevzw7cm0HXkVthHKsjUd7JftLbaKaSmH0iIVN8yCo28/uqSoXzOX3HQSmxqBLVR1kb1hFHUFiIcHriGlDvLyNzX//z8yZ9VI68jk11IFKPrs9nito3giKlPrDqfpwcKOmKgB/2OKAdTzzqZXn/eKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YmtpOPaQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YmtpOPaQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF7361F0089B;
	Mon, 12 Oct 2026 16:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791820997;
	bh=aA4RuapSXvzWzm3bvSg4XtC/6gN1tzzYB0amTjsBjv8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YmtpOPaQExdG5ZPzKNsluqX9t/+k4u5ZayHwgIttA9U/05Y5M0Psdhkz7sVZFi1i6
	 ONS/FqM+2wZmcVHhnAGCmvPRPrQvQWBCeqTIzdMa2Mfs9MFyVdm/q8RM5YChZRATBy
	 3VgFNbOAe1j2vQxSU3/qGss/yep2aa6BOsmkWQ5FN+NaD7i/V5K093FqnE+DTYq4LC
	 hfmLGfQ86CS2QQfv4xr0dieenosr5AGiGBs86ypm51CaRoxfQJ0shTXR+yZKdg9v0m
	 tfCd/XotcmkpHMtEWhBzg/53Vy9rIgAoOFizQN7wH/xcywsp0xyCHZVJzVVFusHGio
	 pV4AWHTfAfmnQ==
Message-ID: <sashiko-outbox-168374@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: f_tcm: reject a short write data-out
 transfer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yehyeong Lee" <yhlee@isslab.korea.ac.kr>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261012154422.2436134-1-yhlee@isslab.korea.ac.kr>
References: <20261012154422.2436134-1-yhlee@isslab.korea.ac.kr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 16:03:17 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] usb: f_tcm: deadlock in BOT mode when rejecting short OUT transfer
- [Medium] usb: gadget: f_tcm: log flooding via un-ratelimited pr_err() on =
short transfers
--

commit 9b6b77ebba18d1575ab661cb225bb326116c901e
Author: Yehyeong Lee <yhlee@isslab.korea.ac.kr>

usb: gadget: f_tcm: reject a short write data-out transfer

This commit routes short write data-out transfers in usbg_data_write_cmpl()
to the error path. This prevents stale buffer data from being committed to
the backend when a transfer falls short of its declared length.

> diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/fun=
ction/f_tcm.c
> index 9e6d4f39900a2..54e45d3c79563 100644
> --- a/drivers/usb/gadget/function/f_tcm.c
> +++ b/drivers/usb/gadget/function/f_tcm.c
> @@ -1090,7 +1090,8 @@ static void usbg_data_write_cmpl(struct usb_ep *ep,=
 struct usb_request *req)
>  		return;
>  	}
> =20
> -	if (req->status) {
> +	/* a short data-out left the buffer unwritten; don't commit stale data =
*/
> +	if (req->status || req->actual !=3D req->length) {
>  		pr_err("%s() state %d transfer failed\n", __func__, cmd->state);
>  		goto cleanup;
>  	}

[Severity: High]
Could routing a successful short transfer into this error path cause a
bus deadlock in BOT mode?

A short packet correctly finishes the OUT data phase from the host's
perspective, but detecting req->actual !=3D req->length here routes executi=
on
to the cleanup path to abort the command without signaling that the data
phase is over or clearing cmd->data_len.

The cleanup path calls transport_send_check_condition_and_sense(), causing
the target core to invoke the queue_status fabric callback with a CHECK
CONDITION. In BOT mode, this triggers bot_send_status(), which falls to its
error branch and calls bot_send_bad_status(cmd).

Because cmd->data_len still holds the original full declared transfer lengt=
h,
bot_send_bad_status() sees cmd->data_len > 0 and queues another OUT request
to sink the supposedly unreceived data:

drivers/usb/gadget/function/f_tcm.c:bot_send_bad_status() {
	if (cmd->data_len) {
		if (cmd->is_read) {
			ep =3D fu->ep_in;
...
		usb_ep_queue(ep, req, GFP_KERNEL);
	} else {
		bot_enqueue_sense_code(fu, cmd);
	}
}

Since the host already ended the data phase with the short packet, it expec=
ts
a CSW on the IN endpoint and will never send more OUT data, which would
result in a permanent bus deadlock.

[Severity: Medium]
Will this allow an untrusted host to cause log flooding?

A USB host can repeatedly send valid short OUT packets where req->actual <
req->length but req->status =3D=3D 0. This change newly routes these standa=
rd
short transfers into the error path.=20

Because the pr_err() call is unconditional and not rate-limited, an attached
host can trigger this behavior by initiating a WRITE and terminating the
data phase early, spamming the kernel log and overwhelming the system.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012154422.2436=
134-1-yhlee@isslab.korea.ac.kr?part=3D1
