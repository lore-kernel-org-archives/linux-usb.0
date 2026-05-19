Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148984C9576
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 10:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779186445; cv=none; b=ukwBKU28WwcoNqF25xCbnmvJ2vZzQy0qf1u68b61gvjcRVZztf5N6kSyWkCuncK/MO5wDzRlpfXiUo7yeHm+nLRQ6wTNJiN4k9gFmBIjVb0OXQXbvJI18GjdnijruiWbZYoa2tFQO3dwdSvdCuOsQYLB6UjQob3BZVZHtsRLLZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779186445; c=relaxed/simple;
	bh=z5XjV4XAbkqcj4wppgcoITyNKKghX4oMjV0HufQGLsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vydjv0Eybx/zc39fFahLWRBrXzShFlXVM9eFLYCZNwGcIjmlwGCtN99J89KFHSTedhcpRy8H8LrB/Z9PbQVwYWXNRc11mFFo/iq/IqafMT1Qb8RFHZctU67VlueTs8zYSoh+QavjL+EQnd6RtiWeNKEvP0gGB7lK6wGxIqoXP5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=imSi9lsF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="imSi9lsF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D28AC2BCB3;
	Tue, 19 May 2026 10:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1779186444;
	bh=z5XjV4XAbkqcj4wppgcoITyNKKghX4oMjV0HufQGLsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=imSi9lsFm/G8U5GG+zbYl8tjMgK3bLmDN88SNfz4r9BTp3p6+1ju9SXVdqSNAKB5O
	 AK10ZCo7I2rBjXBC69DMdGRSgj+XW+JBvlZ84pCYjwHhy3M+SpYWOg8d4lll4XaZTZ
	 NhZs3fRWmHTgtGXGlDmOyIaku1/0lB1vNWCgiILM=
Date: Tue, 19 May 2026 12:24:04 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB4/Thunderbolt fixes for v7.1-rc5
Message-ID: <2026051934-vicinity-brick-7788@gregkh>
References: <20260519101850.GB8580@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519101850.GB8580@black.igk.intel.com>

On Tue, May 19, 2026 at 12:18:50PM +0200, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 5d6919055dec134de3c40167a490f33c74c12581:
> 
>   Linux 7.1-rc3 (2026-05-10 14:08:09 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v7.1-rc5

Pulled and pushed out, thanks.

greg k-h
