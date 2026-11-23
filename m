Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795413243;
	b=bvUlJefaazsPtNAJbBgw6p0vx1RZUY2kO0oSAjtOzdDGmxMiMyVCX8GxGK9KO6BWoHd5
	 VyxXBR9jlHM3rIUPAtU9fYl2pCkuD/S6sj8F+SGaWACBo6B40ggUoyxTEoYgxk8Wacebb
	 FqcppmX9DRfq0/vx/OdIX1fl3PyJBUsLqC0FV2AXIBvsaDcw6Y/T6S9BYYM6OnutwURIc
	 STmnrrhQ3DnjrVR+K2IR0hsSJ98RnXpmbj7yiEb+RvG0AkIB3Q6mZFr3+5jmkg8kOEevB
	 7nvXFiCRAa3jsHjc9hYd3TGID2KDlkeyrolvzfvT5jfdAtzhMbNc6kJjYZZMlUoqjag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795413243;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=2ZYHfF1YmBiOZ58ksE/J8SWBppRgmZzYpJ9dQMiFZiU=;
	b=bsvCEDLjyq5qXz8hGu4CzXxsrc4pl7ON1TuzqlRXGMxIazbc38K39C6I0GxpFEZNxj6m
	 hdFtvQESTy//sLPNf3PimDIsk+hLurf++vPoQZSXYxEhcGOQqCgmB/fRkjdle3ZqVWpBm
	 zI4oUBKRZTv8m1ZA7U64G9/D+kZyT31tR7vp8yLguZP0Vsseiq+65FMmGR5T7UL5wfG53
	 tjjzesF9bFKTuShVDLiwgK1gkDA6Vb0d3LpWmGSW7ZrdhLjgh6SXGOGSJMEMIBZPOx0i7
	 PBnRBfraaAn1gNHomLR/NK1kvubkaxaE5+9wTDFLaqijWpjA9u/wtb8GT72QZwXtViA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GYTqvO+W;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45683606A31A;
	Mon, 23 Nov 2026 05:54:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45683606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GYTqvO+W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795413242; x=1826949242;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bew3rUpuBQA3+G+GX9OOIQ+QQj7THEQGuewbkVg8l6Q=;
  b=GYTqvO+WhLxcHQhzG5RYEQ1t0eXblaMLeJvHF5RauQm55qhtnBLdpSeQ
   mfuO2DGc7Z21IDHaJRIP60rgim7j12KFqs49mQRYat7lUDGhKk9d6FgSp
   MKdd1cHapxXt/vfGqm4xBdvIyfz73ksj81W2TTwyBBNNbUo9Cq9ADghYP
   qa4aWSBqjmoGv3snqzPyoL3Dz1vl9gF9/44LpcdSljZbJrCX1ddcFJ7Mv
   AR/JF7+fR3o7gHWAIhfSERjLkMOq2yG4Eh3W6fCYSxP3fxz99Q4LadYwD
   mIdACk7Lu/8m8vQru5iTNNAMaHhI5NhffBZE7VDDip43vpfxCOm2H7mCn
   g==;
X-CSE-ConnectionGUID: eF/zh0ECQ2G/vVmtbcHF0Q==
X-CSE-MsgGUID: HDQYSkUERPOaUBbeOk7vMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4106920"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4106920"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 21:52:43 -0800
X-CSE-ConnectionGUID: ndtbvU++Sm69sXsaxZcUDw==
X-CSE-MsgGUID: YPG0Dr0tSESagiw0RoU5AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="13196862"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa013.fm.intel.com with ESMTP; 22 Nov 2026 21:52:42 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 45A2799; Mon, 23 Nov 2026 06:52:40 +0100 (CET)
Date: Mon, 23 Nov 2026 06:52:40 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yaohan Li <shunsheng1218@gmail.com>
Cc: Mika Westerberg <westeri@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v3] thunderbolt: cancel the queued control requests
 on teardown
Message-ID: <20261123055240.GN229695@black.igk.intel.com>
References: <20261119111907.3616041-1-shunsheng1218@gmail.com>
 <20261120042721.420468-1-shunsheng1218@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261120042721.420468-1-shunsheng1218@gmail.com>

Hi,

On Fri, Nov 20, 2026 at 12:27:21PM +0800, Yaohan Li wrote:
> tb_domain_remove() stops the control channel but nothing cancels the
> requests still in its queue.  Their completion work is already scheduled
> and the queue itself holds a reference, so tb_ctl_free() releases the
> channel, the rings and the frame pool while that work is still pending.
> 
> Splice the queue instead, cancel the work and release the callback data
> with -ENOTCONN.  The reference the queue held is taken before the request
> becomes unprotected, so a completion that runs in the meantime cannot
> free it under the loop.
> 
> The terminal state is published once.  A request can be canceled by its
> owner after a timeout and by the teardown at the same time, so the error
> and the cancellation hook run under one small lock, and only for a request
> whose completion work has not finished: both callers reach this after
> cancel_work_sync(), so a request whose callback already ran keeps the
> result it published instead of being turned into -ENOTCONN.
> 
> A synchronous request waits on a completion that it passes as the callback
> data, and a canceled request never runs its callback.  It installs that
> same completion as its cancel hook so the teardown wakes it.  The hook runs
> under the same lock, and the owner takes that lock before its stack
> completion goes away and clears the hook, so a hook that is still running
> on another thread has finished by the time the waiter returns.
> 
> The callback data can be the request itself: __tb_xdomain_response() hands
> its reference to response_ready(), which is the callback.  A request that
> is canceled instead never runs it, so the same function is installed as the
> cancel hook and releases the reference from there.  The submission failure
> path already drops it and keeps doing so.
> 
> Two windows have to be covered and one counter cannot cover both.  The
> first is the request that has been admitted and queued but has not been
> handed to the TX ring yet: the teardown cancels it, but the submitter
> still dereferences the channel to send it.  The second is the synchronous
> user that keeps using the channel after the send, through the wait, the
> timeout and the cancel, and the teardown can run in between; the retry
> loops in tb_cfg_read_raw(), tb_cfg_write_raw() and icm_request() keep
> using it after one request has finished, and so do tb_cfg_read() and
> tb_cfg_write() when they report the result.  Every user is therefore
> registered on the channel with two counters, both taken under
> request_queue_lock - the lock tb_ctl_stop() uses to clear @running, so no
> user can appear once the channel has been stopped.  @submitting covers
> the first window, and the rings are not stopped before it drops to zero;
> @sync_users covers the second from the first access to the last one, and
> tb_ctl_cancel_requests() waits for it before the channel may be freed.
> 
> Dropping the counter is not enough.  The thread that drops the last one
> still holds @request_queue_lock until its ..._exit() returns, so both
> waits are followed by taking and releasing that lock: after that the last
> user has left the channel, not just the count.
> 
> A config access that is rejected or canceled because the channel is going
> away now returns -ENOTCONN from tb_cfg_read() and tb_cfg_write() instead
> of falling into their default branch and warning.
> 
> tb_ctl_stop() no longer warns about requests left in the queue.  They are
> expected to be there: they are what tb_ctl_cancel_requests() runs on next,
> and the unlocked list_empty() check did not match a queue that is modified
> under request_queue_lock.
> 
> tb_domain_add() calls tb_ctl_cancel_requests() on its error path as
> well: a failing driver_ready() or start() leaves requests behind and that
> domain is released without tb_domain_remove().

I recommend writing the changelogs yourself, not taking whatever the LLM
generates verbatim.

> Fixes: d7f781bfdbf4 ("thunderbolt: Rework control channel to be more reliable")
> Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
> 
> ---
> Prepared against v7.4-rc1-1969-g666539eecdf4.
> 
> Tested with a controlled interleaving test: drivers/thunderbolt/ctl.c is
> compiled verbatim into a module on a KASAN kernel built from this tree
> (x86_64, QEMU/KVM), with only the NHI ring backend replaced.  The test parks
> a submitter inside tb_ctl_tx() with a completion, calls tb_ctl_stop() from
> another thread and checks that the rings are stopped only after the submitter
> returned; it also checks that a synchronous waiter is woken by
> tb_ctl_cancel_requests() with -ENOTCONN, that an owner cancel racing the
> teardown cancel releases callback_data once and publishes one terminal error,
> and that a submitter arriving after the stop is rejected without touching the
> ring.
> 
> All 47 assertions pass on this patch.  Against 666539eecdf4 the same
> scenarios fail (the ring is stopped before the submitter returns, tx=2
> stop=1).  The additional controlled interleavings cover:
> 
>  - a cancel hook that is parked inside the lock blocks the second canceller
>    until it returns, and the hook runs exactly once;
>  - a synchronous owner that is woken by the teardown clears its stack
>    completion hook before it returns, and reads the published result;
>  - a request whose callback already ran keeps its result when the teardown
>    cancels it afterwards, and its cancel hook is not called;
>  - a request whose callback and cancel hook hand over the same reference
>    (the __tb_xdomain_response() pattern) releases it when it is canceled,
>    which the test checks through a reference it keeps itself;
>  - the worst case of the two: the synchronous owner runs into its timeout
>    while the teardown's hook is parked inside the lock just before it wakes
>    the owner.  The owner must not return before that hook finishes, and the
>    result it reads is the one the teardown published;
>  - a config read that is inside its retry loop when the channel is stopped:
>    the teardown returns only after the whole read has left the channel, the
>    read ends with -ENOTCONN, and the admission counter is back to zero;
>  - tb_cfg_read() on a torn down channel returns -ENOTCONN and the log has no
>    warning from it.
> 
> The read that is inside its retry loop is also the only case that observes
> the wait itself; the moment between its decrement of @sync_users and the
> release of @request_queue_lock cannot be parked in from the test, so that
> ordering rests on the code and not on a reproduced interleaving.
> 
> The remaining callers that submit on the TX ring were audited instead of
> being admitted, because each already sits behind an outer guarantee.
> tb_cfg_ack_notification() and tb_cfg_ack_plug() are called only from the
> control channel callback, which runs in ring_work() and is therefore
> finished when tb_ring_stop(ctl->rx) returns; tb_ctl_stop() stops the RX ring
> before the TX ring, so those acks cannot reach a stopped TX ring.
> tb_cfg_reset() reads ctl->timeout_msec before tb_cfg_request_sync() admits
> the user, but both of its callers (tb_start() and tb_resume_noirq()) hold
> tb->lock for the whole call, and the channel is released from
> tb_domain_remove(), which takes the same lock; the request that follows is
> then either admitted or refused by tb_cfg_request_sync().
> 
> The Thunderbolt controller itself was not available, so no hardware timing
> was exercised.
> 
> The initialisation failure, suspend and cancellation paths were audited
> rather than run.  tb_ctl_alloc() hands partially initialised pointers to
> tb_ctl_free(), which is safe: dma_pool_destroy() returns early for a NULL
> pool and tb_ctl_pkg_free() accepts a NULL package.  tb_domain_suspend() and
> tb_domain_suspend_noirq() call tb_ctl_stop() with tb->lock held and leave the
> queued requests for the resume, which is unchanged, and no submitter takes
> tb->lock, so the new wait cannot invert against it.  The owner-cancel and
> teardown-cancel race is the one the test drives.
> 
> Checked against mainline 21a7f44fd076, where the patch applies, and against
> the list traffic: no fix for this teardown is in flight.  The AMD USB4 router
> work from 2026-10 ("Fix tb->lock deadlock during hot-unplug on AMD USB4
> routers") moves the router reset and does not cancel control requests, so the
> two do not overlap.
> 
> AI assistance: the analysis, the change and its review notes were
> prepared with Claude (Anthropic) as a coding assistant.  The author
> reviewed the reasoning and takes responsibility for the content.
> ---
>  drivers/thunderbolt/ctl.c     | 362 ++++++++++++++++++++++++++++++----
>  drivers/thunderbolt/ctl.h     |  20 ++
>  drivers/thunderbolt/domain.c  |  14 ++
>  drivers/thunderbolt/icm.c     |  38 +++-
>  drivers/thunderbolt/xdomain.c |   6 +
>  5 files changed, 404 insertions(+), 36 deletions(-)

Same comment applies here. This is huge change for a case that has not run
on a real hardware. I don't feel comfortable taking anything like this
until it has been first proven that the problem exists (on real hardware)
and then that the fix actually works and does not cause any side-effects.
So far I don't remember anybody reporting any issue like this.

Also if possible please try to make the fixes as small as possible so that
they are easy to back port to stable trees (sometimes that's not possible
and then its okay).
