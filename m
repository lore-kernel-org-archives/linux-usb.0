Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792833072;
	b=k+OzlopWWEDvRlSwTiSya2fpiyzQtzsiG9mECc6XpSs6AuCXmaHT8UxrwYd/RX7XosJo
	 yCQNC/l/480bxwxue2OhOmkqn4HH67U7MYWiHoBh5nmjDWKAeplrooO3u4OoB+eMLsnCl
	 aqG2HkPornFnREvz6xV038UG62jsqB24aiUPArk16xc4G0PpfsqPkHdKRjqTut9zK5LvC
	 ZjmMCNz/LVSRCWEoty0docW1hv+GWy6cNJV9cG4TuYgNE2VMUOSqtvVbtqRBPoveGL2YY
	 LbHmvqMAjQ0D0QjXmwiWixX2c6aHWcOeI0rcj7TbFRdf6IQM6RXDFGC38hxq5mHLUIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792833072;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=zBEORvLFi25a8/Gffq0WUO8RB/AEisyYoqyh+qXp48M=;
	b=dx6+RZJ0Kxj95zWtyp2CVsyxVPCxj4oftUzmse1CEw9QdLcid2OxuG2tc/yl0RxAhtZ4
	 2qufu99Dg4C3wf0jOo5G9y+iYQnRfkpchvK33S6T/oS3Ds/CcXN33OKmCuQrABbrCX1zs
	 1wl1gBgTE13JfOgIRXZytH7bvUsG8jp84VurirDxtFxgQBtdPOERJvOcddXFgBWArStrf
	 9CX2SMrD6IZzV0T/gTcwvjs33zSpKairW/fpaySbxwWhvJBRpP+3+m7l6iuz7p3JWWtMc
	 QM6O9lRCTBOw5hdo+wkZvGEw1GJi5kN5SVKUS7QuRI7MNcaERHnZfTXR8FfmExkNqBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OtcQVTay;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8AF606A31A
	for <linux-usb@vger.kernel.org>; Sat, 24 Oct 2026 09:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OtcQVTay
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6A3E1F01825;
	Sat, 24 Oct 2026 09:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792833071;
	bh=zBEORvLFi25a8/Gffq0WUO8RB/AEisyYoqyh+qXp48M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OtcQVTay3NKLnYVik5kJarkgW9Ua2qsw7Olpw24f3FGJfiZq6r5TXPOpxgqWSFC/l
	 VyOkvRM6X371Y3lHJ6Wh/Z7p6IniNCR8eJUvW6kXf0t07wcHhal/DsSzOme7n8hbzf
	 XOgCn0E42W8OAlnSfZUC5o2KE9Ii2w6RNZVV23g0AY7pQIp+6a5u7fJwPXa/UrCmIU
	 QB/20fPFYPdi79LJSAP1nSLT8A9AD3jQm2gssJ1sHbUm54/LImxoMtnZYHrKT3bWl3
	 YjhYJ1kj4Lg9/h6+uXad2P8npXc6zD5if6iFxy9MvbExuSwe4j1J4QcQ/8LIXji9PN
	 a3G1PC132jsgg==
Message-ID: <sashiko-outbox-183606@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] usb: core: hcd: flush giveback work on stop
Reply-To: sashiko-reviews@lists.linux.dev
To: "Igor Putko" <igorpetindev@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261024083647.2599-1-igorpetindev@gmail.com>
References: <20261023174015.54793-1-igorpetindev@gmail.com>
 <20261024083647.2599-1-igorpetindev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 24 Oct 2026 09:11:11 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] usb: core: hcd: incomplete bh work flush in usb_stop_hcd() on =
self-requeue
--

commit 9c9e1488a3b8b0e4cd42d6243a942c8d42aeb233
Author: Igor Putko <igorpetindev@gmail.com>

usb: core: hcd: flush giveback work on stop

This commit adds flush_work() calls on the high and low priority BH work
items in usb_stop_hcd() to prevent a use-after-free on struct usb_hcd when
usb_giveback_urb_bh() is still executing as the HCD is stopped and freed.

> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index a865a15ea3863..9db0f39896065 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -2788,6 +2788,9 @@ static void usb_stop_hcd(struct usb_hcd *hcd)
>  	/* In case the HCD restarted the timer, stop it again. */
>  	clear_bit(HCD_FLAG_POLL_RH, &hcd->flags);
>  	timer_delete_sync(&hcd->rh_timer);
> +
> +	flush_work(&hcd->high_prio_bh.bh);
> +	flush_work(&hcd->low_prio_bh.bh);

[Severity: Critical]
Is a single flush_work() call on each BH work item sufficient to drain all
pending givebacks if usb_giveback_urb_bh() requeues itself?

When an instance of usb_giveback_urb_bh() starts running, process_one_work()
clears WORK_STRUCT_PENDING_BIT and WORK_STRUCT_PWQ on &bh->bh, and
usb_giveback_urb_bh() sets bh->running =3D true while moving bh->head to
local_list.

If another URB is passed to usb_hcd_giveback_urb() while bh->running is tru=
e,
it is appended to bh->head without calling queue_work():

drivers/usb/core/hcd.c:usb_hcd_giveback_urb() {
	...
	spin_lock(&bh->lock);
	list_add_tail(&urb->urb_list, &bh->head);
	running =3D bh->running;
	spin_unlock(&bh->lock);

	if (running)
		;
	else if (bh->high_prio)
		queue_work(system_bh_highpri_wq, &bh->bh);
	else
		queue_work(system_bh_wq, &bh->bh);
}

This can happen without a caller waiting in usb_kill_urb(). For example,
during usb_remove_hcd() -> usb_disconnect(), usb_hcd_flush_endpoint() calls
unlink1(), where usb_hcd_unlink_urb_from_ep() removes the URB from
ep->urb_list before usb_hcd_giveback_urb() adds it to bh->head. The second
loop in usb_hcd_flush_endpoint():

	/* Wait until the endpoint queue is completely empty */
	while (!list_empty (&ep->urb_list)) {

then sees ep->urb_list as empty and returns without calling usb_kill_urb().
Similarly, HCD ->stop(hcd) callbacks invoked in usb_stop_hcd() (such as
_dwc2_hcd_stop() -> dwc2_hcd_disconnect() -> dwc2_kill_all_urbs()) can give
back remaining URBs via usb_hcd_giveback_urb() while an earlier execution of
usb_giveback_urb_bh() is still in progress.

If usb_stop_hcd() calls flush_work(&bh->bh) before the running worker reach=
es
the end of usb_giveback_urb_bh(), &bh->bh is not marked pending, so
start_flush_work() -> insert_wq_barrier() places the flush barrier on
worker->scheduled:

kernel/workqueue.c:insert_wq_barrier() {
	...
	if (worker) {
		head =3D worker->scheduled.next;
		work_color =3D worker->current_color;
	}
	...
}

When the running usb_giveback_urb_bh() then finishes its loop, it sees the
newly added URB on bh->head and requeues &bh->bh onto pool->worklist:

drivers/usb/core/hcd.c:usb_giveback_urb_bh() {
	...
	spin_lock_irq(&bh->lock);
	if (!list_empty(&bh->head)) {
		if (bh->high_prio)
			queue_work(system_bh_highpri_wq, &bh->bh);
		else
			queue_work(system_bh_wq, &bh->bh);
	}
	bh->running =3D false;
	spin_unlock_irq(&bh->lock);
}

When that first execution returns, process_scheduled_works() immediately ru=
ns
the barrier on worker->scheduled and wakes flush_work() before bh_worker()
picks up the requeued &bh->bh from pool->worklist.

Could usb_stop_hcd() then return and allow usb_put_hcd() to free struct
usb_hcd while the requeued usb_giveback_urb_bh() is still pending or runnin=
g?
Also, does the comment above usb_stop_hcd() in usb_remove_hcd() stating that
flush_work() isn't needed there need to be updated?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261024083647.2599=
-1-igorpetindev@gmail.com?part=3D1
