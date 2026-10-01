Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B747C3AEF56
	for <linux-usb@vger.kernel.org>; Thu,  1 Oct 2026 11:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790854031; cv=none; b=KHU5zadEC7BH8yyqmgWdqz90hdnipikxyDi7AysiFwvc5BV962m90KcPMKWbU48OHumestTXuMTfEY3RFwpdEm2/TqB7M8Dsc6iFAFyoblIxAhUVcqDl+V5q3XQYWLvnvYUBSvPCjBk1xouQQxtHRDiFAXqVZadcM+z2IVQTnBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790854031; c=relaxed/simple;
	bh=cqVfnYZ5r4vw7j0poJMEqMxfbdPkD912Jo3YWuKDhfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LoJBJJLPEiDz/7YmTCZs8/jBVysR7hqEUd2rzFydrIEQZBQlcI6ZVj5JDuIubzgjU49b2acDEUSSinYlsvC+iNL2FD9oxRTzORw6A99rST2is94T32o/WRF5IYM/yIix93SMtZV8vvhSvulNX70R9EILRjRMNJP0hlXP2lJKzXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=sFN/3Gtg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="sFN/3Gtg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03F101F000FF;
	Thu,  1 Oct 2026 11:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790854030;
	bh=b6Bk+JH12vdl2/0MfPmUHUxeboLR/twKPY3Cjy+20Xs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=sFN/3Gtg6e65h1w1J9OB2S8qhxfI9nO8ws1A5GRgXLVCo+7x0di8t7JP6OVHbsYIx
	 m0Y8ObXHdjgae/BZ5fEgqQaxEVQOwzfvEwVp7k8KIVPfNUV4wmfauxtVpx8lcyqywn
	 IpQUbzopr3ujDJQ8foSx1vZIx9UhIToP8EuiusjY=
Date: Thu, 1 Oct 2026 13:26:59 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB4/Thunderbolt fixes for v7.3-rc6
Message-ID: <2026100148-cadmium-ashy-fe2f@gregkh>
References: <20261001044639.GD176164@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001044639.GD176164@black.igk.intel.com>

On Thu, Oct 01, 2026 at 06:46:39AM +0200, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit e6df180e976fd08673214bc1305a46a8536aea9a:
> 
>   Revert "thunderbolt: xdomain: Notify peers after enumeration" (2026-09-04 08:28:47 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v7.3-rc6

Pulled and pushed out, thanks.

greg k-h
