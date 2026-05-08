Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F26B315D43;
	Fri,  8 May 2026 11:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778238205; cv=none; b=k1+QigL3H3YoqlNYHRAwMgSMxsJ4lRe/rdRttcTb6DRoXMV+BFtrOu5Jy2pnUi5z63YClEp/T1Qm3MSlVGQcsnVWyoD+z5XkECqgO79MCL2iF89WmMFVqymFB8w3VdirZ/sOJwc1ahkhGt5gHssR8RvR2gN4vuySS4a4wauRzoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778238205; c=relaxed/simple;
	bh=31cQHqr+1Ta+/dG3y37QuyVmyjYQZuitsLQaTlFhE5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pbmDVJBVXM+eOzUUeSaBLWoZcQ2fxb1ByRt06sEOQWX5kjIdDeavk/+UEQEIbgHzkNlefnmAR+w1dMAAF5/wg+t4RPaVjgystCXKjEIWU5y6oWu2d8oN9vGT7aQsiNR2uVM3QaVrnCWo/gD3yqkrp8fpO0CC4XO4CnMQW8K4owk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=j/lE3CMz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="j/lE3CMz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2CD6C2BCB8;
	Fri,  8 May 2026 11:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778238205;
	bh=31cQHqr+1Ta+/dG3y37QuyVmyjYQZuitsLQaTlFhE5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j/lE3CMzW3si/mHd/E5NQH3ijceYjZuqfm8TJ4aN2XWlCXy9xMz/XmXTtjw/ejyYT
	 FFUKwS3ey/mYJerfY2Se73YIJfpNFyRZeLuVB4aNB0P86OLrq65wJLqZ9BgjAEbMDR
	 NJlfSaj0xLwBrU21trWQIah2csX4qL9mII2+HrpY=
Date: Fri, 8 May 2026 13:03:22 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Hongbo Li <lihongbo22@huawei.com>
Cc: heikki.krogerus@linux.intel.com, nathan.c.rebello@gmail.com,
	kyungtae.kim@dartmouth.edu, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6.6 & 5.10] usb: typec: ucsi: validate connector number
 in ucsi_connector_change
Message-ID: <2026050843-denatured-bonfire-6337@gregkh>
References: <20260508092026.1364820-1-lihongbo22@huawei.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508092026.1364820-1-lihongbo22@huawei.com>

On Fri, May 08, 2026 at 05:20:26PM +0800, Hongbo Li wrote:
> Commit d2d8c17ac01a ("usb: typec: ucsi: validate connector
> number in ucsi_notify_common()") and commit 5a1140404cbf ("usb:
> typec: ucsi: skip connector validation before init") add the bounds
> check when do the connector change both in pre-init notification and
> the forward notifications. But they are difficult to backport to
> early stable branch such as LTS 6.6, LTS 5.10 due to many dependencies.
> Instead, we choose to validate connector number in ucsi_connector_change
> directly to avoid out-of-range issue.

Why just these 2 branches?

And what specific commits are needed exactly?  Why not just backport
them all?  that will make future changes apply properly as well, making
the overall work much less over time.

thanks,

greg k-h
