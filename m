Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF95430D3F8;
	Tue,  6 Oct 2026 04:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791260856; cv=none; b=rRsBh72hKAHhjxpogsRmefNOqc1gGOro/aUyV2u0s4rPt/2ksH8jSASranRhF95X1cj2C5u77X32AyOqa9SNObRPYQbMm1PgqDuzS1zjk5SL578yVgQLuO/laOtgm+zdv/2KAq+iXjUIhpRCiliE2SHrxkI384LFrVKI2WE6WnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791260856; c=relaxed/simple;
	bh=r7GD4mHSfhboy9Iq8wIl7yQVgek/fC5TJPcD++YcRgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TBnNJlm9KUQMC9majZh6nX5VevW3N8yqS4abfFeCW+zr5O/ZbEt7yhmjAxCIf9QEewhOyRyOjrzRGzYksd2U64xnJBTE2qycSXd0Cl+2t6Up4laRtOa2sFSkG5LUHolj7pUBf5op9hlQndAgJe3jBSgWYBxJiA4bVSsIZClQOnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mZl4qwiw; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mZl4qwiw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791260854; x=1822796854;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r7GD4mHSfhboy9Iq8wIl7yQVgek/fC5TJPcD++YcRgU=;
  b=mZl4qwiw0Ns76J8CHd7Mtoxb2Se5WucYtzLxWivTA/oiRBy77otf6cc3
   71K9sUrHsBoLvyj9pMl3WlDBXt3DcCbV/28JB/335IGUrTmFVTR86Gl8C
   QDEndHiloFQMIbY8pvNVH0QXq6HkTOOxQAP0wd6AeCl9IxO4/QAD4TWdO
   ocRRAvkE/VGmQN6Euh40FM6rqxnnHv9e33T/MpujtwLpGNOr5tKGmt38a
   QJBtzi8J0pgCDgdqzQFwuw4ECAYi8HInjYsdSOCd8QAkJscbzYrAbbzx3
   ERCUnuDtdxndafHsIpkkA5GlocGVabFlymropGM7AEoN3lPiMDcRe10+w
   w==;
X-CSE-ConnectionGUID: jF80RH8oQXWdZHMOA+XPhQ==
X-CSE-MsgGUID: wNL7a/TJSYiWH5C8Ez1+Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="91001766"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="91001766"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 21:27:32 -0700
X-CSE-ConnectionGUID: Q+AwUjZfTWaCkXAcn/U4NA==
X-CSE-MsgGUID: j45cEulCSGaGpWuld0mCuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="284940190"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 05 Oct 2026 21:27:28 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 5F85A99; Tue, 06 Oct 2026 06:27:27 +0200 (CEST)
Date: Tue, 6 Oct 2026 06:27:27 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
	Mario Limonciello <Mario.Limonciello@amd.com>,
	Sanath S <Sanath.S@amd.com>
Subject: Re: [PATCH 1/3] thunderbolt: Allow tb_ring_start() to fail
Message-ID: <20261006042727.GN176164@black.igk.intel.com>
References: <cover.1790854235.git.Basavaraj.Natikar@amd.com>
 <13c3bccc590ec4a87bb718da0de40a3d041846d8.1790854235.git.Basavaraj.Natikar@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <13c3bccc590ec4a87bb718da0de40a3d041846d8.1790854235.git.Basavaraj.Natikar@amd.com>

Hi,

On Mon, Oct 05, 2026 at 07:13:39PM +0530, Basavaraj Natikar wrote:
> tb_ring_start() returns void, so its callers cannot tell when a ring fails
> to start and keep building an unusable tunnel. On some host interfaces a
> DMA HopID also cannot be reprogrammed until the host interface has been
> reset.
> 
> Hence, let tb_ring_start() return an error and unwind the callers on
> failure: stop an already started TX ring when its RX peer fails to start,
> and disable the DMA paths enabled before the rings were started.
> 
> A stream can also stay open after a failed resume. Therefore, free the
> partial allocations, clear the ring pointers, and let the subsequent I/O
> and close return without touching the freed rings. Check readiness under
> the device mutex and use a wake token so a wakeup is not lost across the
> unlocked sleep.
> 
> Co-developed-by: Sanath S <Sanath.S@amd.com>
> Signed-off-by: Sanath S <Sanath.S@amd.com>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> ---
> 
>  drivers/net/thunderbolt/main.c |  14 ++-
>  drivers/thunderbolt/ctl.c      |  23 ++++-
>  drivers/thunderbolt/dma_test.c |  32 +++++-
>  drivers/thunderbolt/nhi.c      |  12 ++-
>  drivers/thunderbolt/stream.c   | 175 +++++++++++++++++++++------------
>  include/linux/thunderbolt.h    |   2 +-
>  6 files changed, 181 insertions(+), 77 deletions(-)

This is pretty invasive change. How well did you test this?

I would have been hoping we can avoid touching the service drivers
completely.

> diff --git a/drivers/net/thunderbolt/main.c b/drivers/net/thunderbolt/main.c
> index cf51b9c39f4e..93ccccc5cf8b 100644
> --- a/drivers/net/thunderbolt/main.c
> +++ b/drivers/net/thunderbolt/main.c
> @@ -669,8 +669,16 @@ static void tbnet_connected_work(struct work_struct *work)
>  	 * the Rx ring before any incoming packets are allowed to
>  	 * arrive.
>  	 */
> -	tb_ring_start(net->tx_ring.ring);
> -	tb_ring_start(net->rx_ring.ring);
> +	ret = tb_ring_start(net->tx_ring.ring);
> +	if (ret) {
> +		netdev_dbg(net->dev, "failed to start Tx ring, ret=%d\n", ret);

the ret= is not consistent wit the rest of the driver and should this be
_warn() instead? 

> +		goto err_release_hopid;
> +	}
> +	ret = tb_ring_start(net->rx_ring.ring);
> +	if (ret) {
> +		netdev_dbg(net->dev, "failed to start Rx ring, ret=%d\n", ret);
> +		goto err_stop_tx;
> +	}
> 
>  	ret = tbnet_alloc_rx_buffers(net, TBNET_RING_SIZE);
>  	if (ret)
> @@ -701,7 +709,9 @@ static void tbnet_connected_work(struct work_struct *work)
>  	tbnet_free_buffers(&net->rx_ring);
>  err_stop_rings:
>  	tb_ring_stop(net->rx_ring.ring);
> +err_stop_tx:
>  	tb_ring_stop(net->tx_ring.ring);
> +err_release_hopid:
>  	tb_xdomain_release_in_hopid(net->xd, net->remote_transmit_path);
>  	tbnet_connect_failed(net);
>  }
> diff --git a/drivers/thunderbolt/ctl.c b/drivers/thunderbolt/ctl.c
> index 965988b18608..94b29430ffe4 100644
> --- a/drivers/thunderbolt/ctl.c
> +++ b/drivers/thunderbolt/ctl.c
> @@ -728,10 +728,27 @@ void tb_ctl_free(struct tb_ctl *ctl)
>   */
>  void tb_ctl_start(struct tb_ctl *ctl)
>  {
> -	int i;
> +	int i, ret;
>  	tb_ctl_dbg(ctl, "control channel starting...\n");
> -	tb_ring_start(ctl->tx); /* is used to ack hotplug packets, start first */
> -	tb_ring_start(ctl->rx);
> +
> +	/*
> +	 * TX is used to ack hotplug packets so start it first. -ENODEV
> +	 * means the host controller itself is already gone (expected on
> +	 * an unplug-during-suspend resume), so do not warn about that.

What?

> +	 */
> +	ret = tb_ring_start(ctl->tx);
> +	if (ret) {
> +		if (ret != -ENODEV)
> +			tb_ctl_WARN(ctl, "failed to start TX ring\n");
> +		return;
> +	}
> +	ret = tb_ring_start(ctl->rx);
> +	if (ret) {
> +		if (ret != -ENODEV)
> +			tb_ctl_WARN(ctl, "failed to start RX ring\n");
> +		tb_ring_stop(ctl->tx);
> +		return;
> +	}
>  	for (i = 0; i < TB_CTL_RX_PKG_COUNT; i++)
>  		tb_ctl_rx_submit(ctl->rx_packets[i]);
> 
> diff --git a/drivers/thunderbolt/dma_test.c b/drivers/thunderbolt/dma_test.c
> index bcecb0edcb81..e9c01bcfedf9 100644
> --- a/drivers/thunderbolt/dma_test.c
> +++ b/drivers/thunderbolt/dma_test.c
> @@ -203,12 +203,36 @@ static int dma_test_start_rings(struct dma_test *dt)
>  		return ret;
>  	}
> 
> -	if (dt->tx_ring)
> -		tb_ring_start(dt->tx_ring);
> -	if (dt->rx_ring)
> -		tb_ring_start(dt->rx_ring);
> +	if (dt->tx_ring) {
> +		ret = tb_ring_start(dt->tx_ring);
> +		if (ret)
> +			goto err_disable_paths;
> +	}
> +	if (dt->rx_ring) {
> +		ret = tb_ring_start(dt->rx_ring);
> +		if (ret)
> +			goto err_stop_tx;
> +	}
> 
>  	return 0;
> +
> +err_stop_tx:
> +	tb_xdomain_disable_paths(dt->xd, dt->tx_hopid,
> +				 dt->tx_ring ? dt->tx_ring->hop : -1,
> +				 dt->rx_hopid,
> +				 dt->rx_ring ? dt->rx_ring->hop : -1);
> +	if (dt->tx_ring)
> +		tb_ring_stop(dt->tx_ring);
> +	goto err_free;

This is way too fragile :-(

> +err_disable_paths:
> +	tb_xdomain_disable_paths(dt->xd, dt->tx_hopid,
> +				 dt->tx_ring ? dt->tx_ring->hop : -1,
> +				 dt->rx_hopid,
> +				 dt->rx_ring ? dt->rx_ring->hop : -1);
> +err_free:
> +	dma_test_free_rings(dt);
> +
> +	return ret;
>  }
> 
>  static void dma_test_stop_rings(struct dma_test *dt)
> diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
> index e99a3fcc4a29..1960fa30e13a 100644
> --- a/drivers/thunderbolt/nhi.c
> +++ b/drivers/thunderbolt/nhi.c
> @@ -741,18 +741,24 @@ EXPORT_SYMBOL_GPL(tb_ring_alloc_rx);
>   * @ring: Ring to start
>   *
>   * Must not be invoked in parallel with tb_ring_stop().
> + *
> + * Returns %0 on success and negative errno in case of failure.
>   */
> -void tb_ring_start(struct tb_ring *ring)
> +int tb_ring_start(struct tb_ring *ring)
>  {
>  	u16 frame_size;
> +	int ret = 0;
>  	u32 flags;
> 
>  	spin_lock_irq(&ring->nhi->lock);
>  	spin_lock(&ring->lock);
> -	if (ring->nhi->going_away)
> +	if (ring->nhi->going_away) {
> +		ret = -ENODEV;
>  		goto err;
> +	}
>  	if (ring->running) {
>  		dev_WARN(ring->nhi->dev, "ring already started\n");
> +		ret = -EBUSY;
>  		goto err;
>  	}
>  	dev_dbg(ring->nhi->dev, "starting %s %d\n",
> @@ -810,6 +816,8 @@ void tb_ring_start(struct tb_ring *ring)
>  err:
>  	spin_unlock(&ring->lock);
>  	spin_unlock_irq(&ring->nhi->lock);
> +
> +	return ret;
>  }
>  EXPORT_SYMBOL_GPL(tb_ring_start);
> 
> diff --git a/drivers/thunderbolt/stream.c b/drivers/thunderbolt/stream.c
> index 4f9a57b77bfa..48b7e3f01312 100644
> --- a/drivers/thunderbolt/stream.c
> +++ b/drivers/thunderbolt/stream.c
> @@ -259,6 +259,9 @@ static void tbstream_ring_free(struct tbstream_ring *ring)
>  	enum dma_data_direction dir;
>  	int i;
> 
> +	if (!ring->frames)
> +		return;
> +
>  	if (ring->ring->is_tx)
>  		dir = DMA_TO_DEVICE;
>  	else
> @@ -279,6 +282,7 @@ static void tbstream_ring_free(struct tbstream_ring *ring)
>  	ring->prod = 0;
>  	ring->cons = 0;
>  	kfree(ring->frames);
> +	ring->frames = NULL;
>  }
> 
>  static inline bool tbstream_ring_available(const struct tbstream_ring *ring)
> @@ -575,6 +579,9 @@ static int tbstream_dev_send_close(struct tbstream_dev *sdev)
>  	struct tbstream_frame *sf;
>  	ktime_t timeout;
> 
> +	if (!sdev->tx_ring.ring)
> +		return -ESHUTDOWN;
> +
>  	/*
>  	 * Wait for the ring to have available slots before we send the
>  	 * CLOSE packet.
> @@ -645,7 +652,7 @@ static int tbstream_dev_start(struct tbstream_dev *sdev)
> 
>  	ret = tbstream_dev_alloc_tx_buffers(sdev);
>  	if (ret)
> -		goto err_free_tx;
> +		goto err_free_tx_buffers;
> 
>  	e2e_tx_hop = ring->hop;
>  	sof_mask = BIT(TBSTREAM_FRAME_START);
> @@ -672,8 +679,12 @@ static int tbstream_dev_start(struct tbstream_dev *sdev)
> 
>  	sdev->rx_pending = false;
> 
> -	tb_ring_start(sdev->tx_ring.ring);
> -	tb_ring_start(sdev->rx_ring.ring);
> +	ret = tb_ring_start(sdev->tx_ring.ring);
> +	if (ret)
> +		goto err_disable_paths;
> +	ret = tb_ring_start(sdev->rx_ring.ring);
> +	if (ret)
> +		goto err_stop_tx;
> 
>  	ret = tbstream_dev_alloc_rx_buffers(sdev);
>  	if (ret)
> @@ -682,13 +693,20 @@ static int tbstream_dev_start(struct tbstream_dev *sdev)
> 
>  err_stop:
>  	tb_ring_stop(sdev->rx_ring.ring);
> +	tbstream_ring_free(&sdev->rx_ring);
> +err_stop_tx:
>  	tb_ring_stop(sdev->tx_ring.ring);
> +err_disable_paths:
> +	tb_xdomain_disable_paths(xd, sdev->out_hopid, sdev->tx_ring.ring->hop,
> +				 sdev->in_hopid, sdev->rx_ring.ring->hop);
>  err_free_rx:
>  	tb_ring_free(sdev->rx_ring.ring);
> +	sdev->rx_ring.ring = NULL;
>  err_free_tx_buffers:
>  	tbstream_ring_free(&sdev->tx_ring);
> -err_free_tx:
>  	tb_ring_free(sdev->tx_ring.ring);
> +	sdev->tx_ring.ring = NULL;
> +	wake_up_interruptible(&sdev->wait);
> 
>  	return ret;
>  }
> @@ -708,6 +726,10 @@ static void tbstream_dev_stop(struct tbstream_dev *sdev)
>  {
>  	struct tb_xdomain *xd;
> 
> +	/* Starting may have failed and freed the rings already */
> +	if (!sdev->tx_ring.ring)
> +		return;
> +
>  	if (sdev->busy_poll) {
>  		/*
>  		 * When busy polling we must advance the ring ourselves
> @@ -742,6 +764,7 @@ static void tbstream_dev_stop(struct tbstream_dev *sdev)
>  	tbstream_ring_free(&sdev->tx_ring);
>  	tb_ring_free(sdev->tx_ring.ring);
>  	sdev->tx_ring.ring = NULL;
> +	wake_up_interruptible(&sdev->wait);
>  }
> 
>  /* Use only with read_iter/write_iter() to handle nowait */
> @@ -757,29 +780,6 @@ static int tbstream_dev_lock(struct tbstream_dev *sdev, bool nowait)
>  	return 0;
>  }
> 
> -/* Must not be called with @sdev->lock held */
> -static int tbstream_dev_busy_poll_wait(struct tbstream_dev *sdev,
> -				       struct tbstream_ring *ring)
> -{
> -	for (;;) {
> -		if (signal_pending(current))
> -			return -ERESTARTSYS;
> -		if (tb_ring_poll_pending(ring->ring))
> -			return 0;
> -		/*
> -		 * For TX ring we need to check the RX side too because
> -		 * it might have received CLOSE packet.
> -		 */
> -		if (ring == &sdev->tx_ring &&
> -		    tb_ring_poll_pending(sdev->rx_ring.ring))
> -			return 0;
> -		if (tbstream_dev_valid(sdev) != 0 ||
> -		    tbstream_dev_closed(sdev) || tbstream_dev_removed(sdev))
> -			return 0;
> -		cond_resched();
> -	}
> -}
> -
>  static bool
>  tbstream_dev_has_event(struct tbstream_dev *sdev, struct tbstream_ring *ring)
>  {
> @@ -796,6 +796,52 @@ tbstream_dev_has_event(struct tbstream_dev *sdev, struct tbstream_ring *ring)
>  	return tb_ring_poll_pending(sdev->rx_ring.ring);
>  }
> 
> +static bool tbstream_dev_ready(struct tbstream_dev *sdev,
> +			       struct tbstream_ring *ring)
> +{
> +	lockdep_assert_held(&sdev->lock);
> +
> +	/* Starting may have failed and freed the rings already */
> +	if (!sdev->tx_ring.ring)
> +		return true;
> +
> +	return tbstream_dev_has_event(sdev, ring) ||
> +	       tbstream_dev_close_received(sdev) ||
> +	       tb_ring_poll_pending(ring->ring);
> +}
> +
> +/* Must not be called with @sdev->lock held. */
> +static int tbstream_dev_wait(struct tbstream_dev *sdev,
> +			     struct tbstream_ring *ring)
> +{
> +	DEFINE_WAIT_FUNC(wait, woken_wake_function);

woken_wake_function?

> +	int ret = 0;
> +
> +	add_wait_queue(&sdev->wait, &wait);
> +	for (;;) {
> +		bool ready;
> +
> +		ret = mutex_lock_interruptible(&sdev->lock);
> +		if (ret)
> +			break;
> +		ready = tbstream_dev_ready(sdev, ring);
> +		mutex_unlock(&sdev->lock);
> +		if (ready)
> +			break;
> +		if (signal_pending(current)) {
> +			ret = -ERESTARTSYS;
> +			break;
> +		}
> +		if (sdev->busy_poll)
> +			cond_resched();
> +		else
> +			/* The wake token bridges the unlocked check-to-sleep gap. */
> +			wait_woken(&wait, TASK_INTERRUPTIBLE, MAX_SCHEDULE_TIMEOUT);
> +	}
> +	remove_wait_queue(&sdev->wait, &wait);

This is also really complex to just handle the error in tb_ring_start(). I
wonder what scenarios were actually tested?

> +	return ret;
> +}
> +
>  static ssize_t
>  tbstream_dev_fops_read_iter(struct kiocb *kiocb, struct iov_iter *to)
>  {
> @@ -814,6 +860,11 @@ tbstream_dev_fops_read_iter(struct kiocb *kiocb, struct iov_iter *to)
>  		return ret;
> 
>  	for (;;) {
> +		if (!sdev->tx_ring.ring) {
> +			mutex_unlock(&sdev->lock);
> +			return -ESHUTDOWN;

Now the ring went away behind the reader?

I don't think this is a good approach to be honest.

> +		}
> +
>  		/* Advance RX completions */
>  		tbstream_dev_advance_rx(sdev);
> 
> @@ -838,16 +889,9 @@ tbstream_dev_fops_read_iter(struct kiocb *kiocb, struct iov_iter *to)
>  		if (nowait)
>  			return -EAGAIN;
> 
> -		if (sdev->busy_poll) {
> -			ret = tbstream_dev_busy_poll_wait(sdev, &sdev->rx_ring);
> -			if (ret)
> -				return ret;
> -		} else {
> -			ret = wait_event_interruptible(sdev->wait,
> -				tbstream_dev_has_event(sdev, &sdev->rx_ring));
> -			if (ret)
> -				return ret;
> -		}
> +		ret = tbstream_dev_wait(sdev, &sdev->rx_ring);
> +		if (ret)
> +			return ret;
> 
>  		ret = tbstream_dev_lock(sdev, nowait);
>  		if (ret)
> @@ -957,6 +1001,11 @@ tbstream_dev_fops_write_iter(struct kiocb *kiocb, struct iov_iter *from)
>  		return ret;
> 
>  	for (;;) {
> +		if (!sdev->tx_ring.ring) {
> +			mutex_unlock(&sdev->lock);
> +			return -ESHUTDOWN;
> +		}
> +
>  		/* Advance TX (and RX) completions */
>  		tbstream_dev_advance_both(sdev);
> 
> @@ -984,17 +1033,9 @@ tbstream_dev_fops_write_iter(struct kiocb *kiocb, struct iov_iter *from)
>  		if (nowait)
>  			return -EAGAIN;
> 
> -		if (sdev->busy_poll) {
> -			ret = tbstream_dev_busy_poll_wait(sdev, &sdev->tx_ring);
> -			if (ret)
> -				return ret;
> -		} else {
> -			ret = wait_event_interruptible(sdev->wait,
> -				tbstream_dev_has_event(sdev, &sdev->tx_ring) ||
> -				tbstream_dev_close_received(sdev));
> -			if (ret)
> -				return ret;
> -		}
> +		ret = tbstream_dev_wait(sdev, &sdev->tx_ring);
> +		if (ret)
> +			return ret;
> 
>  		ret = tbstream_dev_lock(sdev, nowait);
>  		if (ret)
> @@ -1041,7 +1082,7 @@ tbstream_dev_fops_poll(struct file *file, struct poll_table_struct *wait)
> 
>  	poll_wait(file, &sdev->wait, wait);
>  	guard(mutex)(&sdev->lock);
> -	if (tbstream_dev_valid(sdev) != 0)
> +	if (tbstream_dev_valid(sdev) != 0 || !sdev->tx_ring.ring)
>  		return EPOLLHUP | EPOLLERR;
> 
>  	/*
> @@ -1105,6 +1146,11 @@ static int tbstream_dev_fops_open(struct inode *inode, struct file *file)
>  		}
>  	}
> 
> +	if (sdev->users && !sdev->tx_ring.ring) {
> +		ret = -ESHUTDOWN;
> +		goto err_unlock;
> +	}
> +
>  	/* Only on first open we allocate rings and enable paths */
>  	if (!sdev->users++) {
>  		ret = tbstream_dev_start(sdev);
> @@ -1136,7 +1182,7 @@ static int tbstream_dev_fops_release(struct inode *inode, struct file *file)
>  	struct tbstream_dev *sdev = to_tbstream_dev(file->private_data);
> 
>  	mutex_lock(&sdev->lock);
> -	if (--sdev->users == 0) {
> +	if (--sdev->users == 0 && sdev->tx_ring.ring) {
>  		/*
>  		 * Advance now in case there is CLOSE waiting in the RX
>  		 * ring.
> @@ -1884,14 +1930,14 @@ static int __maybe_unused tbstream_suspend(struct device *dev)
>  	if (!sg)
>  		return 0;
> 
> +	mutex_lock(&sg->lock);
>  	list_for_each_entry_reverse(sdev, &sg->dev_list, list) {
> -		tbstream_dev_get(sdev);
> -		/* Stop the stream (if it was open) */
> +		mutex_lock(&sdev->lock);
>  		if (sdev->users)
>  			tbstream_dev_stop(sdev);
> -		tbstream_dev_put(sdev);
> +		mutex_unlock(&sdev->lock);

What's this?

>  	}
> -
> +	mutex_unlock(&sg->lock);
>  	config_group_put(&sg->group);
>  	return 0;
>  }
> @@ -1902,28 +1948,27 @@ static int __maybe_unused tbstream_resume(struct device *dev)
>  	struct tbstream *stream = tb_service_get_drvdata(svc);
>  	struct tbstream_group *sg;
>  	struct tbstream_dev *sdev;
> +	int ret = 0;
> 
>  	sg = tbstream_group_find(stream);
>  	if (!sg)
>  		return 0;
> 
> +	mutex_lock(&sg->lock);
>  	list_for_each_entry(sdev, &sg->dev_list, list) {
> -		tbstream_dev_get(sdev);
> +		mutex_lock(&sdev->lock);
>  		if (sdev->users) {
> -			int ret;
> +			int err = tbstream_dev_start(sdev);
> 
> -			ret = tbstream_dev_start(sdev);
> -			if (ret) {
> -				tbstream_dev_put(sdev);
> -				config_group_put(&sg->group);
> -				return ret;
> -			}
> +			if (err && !ret)
> +				ret = err;
>  		}
> -		tbstream_dev_put(sdev);
> +		mutex_unlock(&sdev->lock);
> +		wake_up_interruptible(&sdev->wait);
>  	}
> -
> +	mutex_unlock(&sg->lock);
>  	config_group_put(&sg->group);
> -	return 0;
> +	return ret;
>  }
> 
>  static const struct dev_pm_ops tbstream_pm_ops = {
> diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
> index 57502da29080..5fce1b67c376 100644
> --- a/include/linux/thunderbolt.h
> +++ b/include/linux/thunderbolt.h
> @@ -672,7 +672,7 @@ struct tb_ring *tb_ring_alloc_rx(struct tb_nhi *nhi, int hop, int size,
>  				 unsigned int flags, int e2e_tx_hop,
>  				 u16 sof_mask, u16 eof_mask,
>  				 void (*start_poll)(void *), void *poll_data);
> -void tb_ring_start(struct tb_ring *ring);
> +int tb_ring_start(struct tb_ring *ring);
>  bool tb_ring_flush(struct tb_ring *ring, unsigned int timeout_msec);
>  void tb_ring_stop(struct tb_ring *ring);
>  void tb_ring_free(struct tb_ring *ring);
> -- 
> 2.34.1
