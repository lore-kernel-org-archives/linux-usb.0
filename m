Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7309343CEC5;
	Wed,  1 Apr 2026 13:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775050700; cv=none; b=cHHVN+EHbUbuOChKq5ZBdQ35VCrid6/V1sPvLF7jQZa2LOJYoTW7jgjAao2j6RbHfCri1LP1UYIYp2H23Ku1gelrO20PriBWV2ZvNXkd/0+E8easE5fhsF8/fAu8TOh7n65npMQY80kfTfufpiEh5ltp0BY8rZiGfVV/dzCH6Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775050700; c=relaxed/simple;
	bh=XC2A2BfNuaHwWBFpTSHeQ5AFz6V+30DkFd6RW8BE7cQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mnHWMEmfUFg9qtMqnFP9qGjDZ51C7PRF36qIhjhRWD6PSXXiqzwhxu0qdFXlK5M6yFdU77oupEtucaY4nDvSBlp+q1lQzdccj4vzZ9D5Ek5p2Ss/aTzvR9JJ5iiMf9KipEESp42D8I/4ynZoeyk8aPOHGPR5TKFEQCAX97iex1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MTUq6rUZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MTUq6rUZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96FFDC4CEF7;
	Wed,  1 Apr 2026 13:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775050700;
	bh=XC2A2BfNuaHwWBFpTSHeQ5AFz6V+30DkFd6RW8BE7cQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MTUq6rUZ0ZxGmau0+2eUhGwCjs3mJhZ3M1ILcEzCBPwDUx+jt0/8vFNKJxSa6jyvA
	 fFeEMKfdgnsOYLHKwIAyQN2idcvPXOQeZuEdW6Yj9LchtF6CKlVBRF8I/IjJpwWe2L
	 VlhV6QjZuPdtUfKl982A3kAk2UPQF1QKUKZRu4TI=
Date: Wed, 1 Apr 2026 15:38:17 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Guan-Yu Lin <guanyulin@google.com>
Cc: mathias.nyman@intel.com, perex@perex.cz,
	dominique.martinet@atmark-techno.com, eadavis@qq.com,
	hannelotta@gmail.com, tiwai@suse.com, quic_wcheng@quicinc.com,
	broonie@kernel.org, arnd@arndb.de, xiaopei01@kylinos.cn,
	wesley.cheng@oss.qualcomm.com, sakari.ailus@linux.intel.com,
	stern@rowland.harvard.edu, amardeep.rai@intel.com,
	xu.yang_2@nxp.com, andriy.shevchenko@linux.intel.com,
	nkapron@google.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v4 0/2] usb: offload: Decouple interrupter lifecycle and
 refactor usage tracking
Message-ID: <2026040148-cucumber-automatic-9a6b@gregkh>
References: <20260401123238.3790062-1-guanyulin@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401123238.3790062-1-guanyulin@google.com>

On Wed, Apr 01, 2026 at 12:32:16PM +0000, Guan-Yu Lin wrote:
> The current USB offload implementation couples the allocation of xHCI
> sideband interrupters with the device's offload usage counter. This
> coupling is conceptually incorrect, as hardware resource availability
> and power management state serve distinct purposes.
> 
> Furthermore, the reliance on the coarse USB device lock for offload
> state updates has led to potential recursive locking issues,
> especially during device disconnect when the lock is already held
> by the USB core.
> 
> This series refactors the offload synchronization by introducing a
> dedicated spinlock for offload state, allowing for more granular
> concurrency control and avoiding deadlocks. It also optimizes power
> management by ensuring that offload state is only modified when the
> device is already active, avoiding unnecessary auto-resumes.
> 
> Patch 1 introduces the `offload_lock` spinlock and `offload_pm_locked`
> synchronization, replacing the coarse `udev->lock` and the legacy
> `offload_at_suspend` flag. It also updates `usb_offload_get/put` to use
> `pm_runtime_get_if_active()`.
> 
> Patch 2 removes the implicit usage tracking from the xHCI sideband layer
> and delegates the responsibility to class drivers, who have the
> correct context for managing offload data stream activity.

Ok, this looks much better, thanks for the revisions.

If the xhci maintainer acks these, I'll be glad to apply them to my
tree.

thanks,

greg k-h
