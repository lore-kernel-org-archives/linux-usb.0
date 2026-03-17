Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF543B582E
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 11:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773748573; cv=none; b=trruCk3/+U+XH1vNB19raZrfjYJo4LxlslF0npoeqkJsqy9gthfVLn9J+inlNAbR3FlYtrcA1XdnbGjMc0eqS2zPRf6uOGNKLT5OOXei0Z+7+VF1lAQBYqeZvaPVEyxLmGnHa5kN26k3yS2AzWCe6dsgBNzMGBJ00XnNMw5b0fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773748573; c=relaxed/simple;
	bh=q+RI2zuh4+hLHWfQQKXOqEjxfTUitdZfcyQvIoeB9WM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gtPPAWZF7AyfTfK4DNhc5kHGD+atjUNdEjv/YKbNvmdsrWvT+IRNlbSxg4NmFLD2X04CMgIi1vP8coDwPlsLZawpnHhvJcn4XPxG2uni4Lf6QwRAHd4Uo3vWdSc99c5ikoC3x+RyfsgEOQePYvgMPkWAZQvN9qcD+3aNHmNGJRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NR6uej+o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NR6uej+o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67856C4CEF7;
	Tue, 17 Mar 2026 11:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773748572;
	bh=q+RI2zuh4+hLHWfQQKXOqEjxfTUitdZfcyQvIoeB9WM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NR6uej+oNFtj2qjycHob9rWoywURHBSwZVR+MuAAOINTcFnhJd80B3DKqviCcOd23
	 vtA2L1BMldD58fFDoX2ry9A2Uc+/PhhNCuf73h3TVyToIkX5gx9vB7+6APGqA9YfID
	 nHCPyURRJwzlWuAo44jml5HitGxGxqDRKd9nbTQ0=
Date: Tue, 17 Mar 2026 12:54:49 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB4/Thunderbolt fix for v7.0-rc5
Message-ID: <2026031743-superglue-console-170b@gregkh>
References: <20260317112341.GF2275908@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317112341.GF2275908@black.igk.intel.com>

On Tue, Mar 17, 2026 at 12:23:41PM +0100, Mika Westerberg wrote:
> Hi Greg,
> 
> The following changes since commit 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681:
> 
>   Linux 7.0-rc3 (2026-03-08 16:56:54 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git tags/thunderbolt-for-v7.0-rc5

Pulled and pushed out, thanks.

greg k-h
