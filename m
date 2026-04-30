Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE36A3624AB;
	Thu, 30 Apr 2026 16:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777568006; cv=none; b=GovXlNEMQ/yoClTcW2yWq6IuWRWTlqA7zuJlhFxDk+fFrR7G0liUeY7DfQSOpy7ClIJkOWw34YCYzwHDYPC3GUuvqxLKgOQH9t7RMEp2gDax45+DcalbUOPbOtfgBx3KY7rCtdhHHN8/mlYsHFkfF/F8y26B+r0MhTYv0ZIG5Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777568006; c=relaxed/simple;
	bh=1N+AWIpyBPX3Hg1K9IC6abjOw/k9hF6/DbnNdoiaz/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RK3nbqfzMCLlIBLPn9w6tR4RviO0m9WLnPi06bKaG3jaM4veAXKBo79DwLn4RzmJPTFPngW+XPRcY+Hl/Q454uJLe/45IxojkVzCj7D6X9CMhU+d9C7R8SuqK/CVYR9nqRUGmqVBoGZsfjShHq6UN6Hw078k067AgurZCxqgMQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TMRrztkt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TMRrztkt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 271BDC2BCB3;
	Thu, 30 Apr 2026 16:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777568006;
	bh=1N+AWIpyBPX3Hg1K9IC6abjOw/k9hF6/DbnNdoiaz/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TMRrztktLZQEIA5z8JDWGwZ1AY0Fj2VzBvAoOWuRC1m8OOqLtQfOMJTRG0PbSCp1J
	 F9NAJdNwyJLFmncCUZeHl31Rnm6sCiS/wTzxDKh1M55njqb5fs4sKBgOoL7YA8CGGQ
	 AxICsByjBoggNAe8Xw81npcQQ1ylFg2OqNobLxjc=
Date: Thu, 30 Apr 2026 18:26:40 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: SnailSploit | Kai Aizen <kai.aizen.dev@gmail.com>
Cc: linux-usb@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	balbi@kernel.org, w@1wt.eu,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	SnailSploit | Kai Aizen <95986478+SnailSploit@users.noreply.github.com>
Subject: Re: [PATCH] usb: gadget: uvc: hold opts->lock across XU walks in
 uvc_function_bind
Message-ID: <2026043022-calcium-rendering-375e@gregkh>
References: <20260430152702.60771-1-95986478+SnailSploit@users.noreply.github.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430152702.60771-1-95986478+SnailSploit@users.noreply.github.com>

On Thu, Apr 30, 2026 at 06:27:02PM +0300, SnailSploit | Kai Aizen wrote:
> From: "SnailSploit | Kai Aizen" <95986478+SnailSploit@users.noreply.github.com>

That's not a valid name/email address :(

thanks,

greg k-h
