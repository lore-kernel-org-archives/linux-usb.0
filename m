Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA93312B143
	for <linux-usb@vger.kernel.org>; Fri, 12 Jun 2026 08:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781254049; cv=none; b=QFm5xZbgbvkIe5u48embVj4Ndz2ijzcXiwGDMRm+mNBqKc68u58ExFqS5u/ENzX4fmCcYYwl8vYWg8dQwTeGVmwNbISqJz46YTykpKwmkRenYBUYLxLhjEtyvQaK7MCN6w8EaEzJ2yUeW6Gyi4ILV+1lysMZqDwmaYh18H1Mwzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781254049; c=relaxed/simple;
	bh=FiHuCwVjAJZAmc1hh6q5qidriSJcleB8ydyluBDYffM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J92Pu4g5CsMAJVK9+s6N7Mf/5ZYujgZfPQenhKJh4Mvu6tVLZA++H5ZcZjqZuCDe7nZFOGSkJ4ZgmBjtnrz+4UZ4VrRazHmJ4nGkJyg94IQXaELTO5NCdN7l4krBswOzTT6AZw8haN0NUdpu9YnWUYMwVkFr8t7+G57AbU7v93M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=i/O/x9+u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="i/O/x9+u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CB031F000E9;
	Fri, 12 Jun 2026 08:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781254048;
	bh=XiEfwSzd7qqprocPcuwlfXViUSaGMqPHUr/wHYItxSw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i/O/x9+u+OYGDmOnxwkKSR5ybhDFeu/vfhOq4uCNd3FUk5MJOj7fk0nRpZw23OJy+
	 hMznqBfPcWOAn2jLdcdkdKAHT6oC7r/okgEbTPkGMw+st+ENF6gZpavip8phvy+zGV
	 VL4/tyPbnBSke6SaTiCcd4SrEvZaMubzo+zwxWao=
Date: Fri, 12 Jun 2026 10:44:54 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB4/Thunderbolt changes for v7.2 merge window
Message-ID: <2026061238-ensnare-wrangle-01ba@gregkh>
References: <20260611084845.GX2990@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611084845.GX2990@black.igk.intel.com>

On Thu, Jun 11, 2026 at 10:48:45AM +0200, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v7.2-rc1

Pulled and pushed out.  And thanks for the merge resolution, that
helped!

greg k-h
