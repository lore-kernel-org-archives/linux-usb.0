Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE70390C90;
	Mon, 27 Apr 2026 03:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261897; cv=none; b=C1m9Ocd1zZKqNq9TbFPmw5nztZgA04fZyJe5RAiaVk8yjlQQ/afJhjRXb953p8f8zROL8rxdnUlYiiekJFKWtf5qbt/AZlHkC73bfijU+ufG2GwB4XaoGi9cxlZL9VbEoaozYwWask9agoobLzC4cBIBhEx56N5L/YqlODa/KfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261897; c=relaxed/simple;
	bh=9OUyQeeITyTHFWrfXU6VFeIRYwZiT6wNkksq/mESYrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tGbDh9egnnYtYsvAwKM8uuAen/9G3EXf/QvP4v6ChSN7bFM1TInZ/X85LpQ/4lSOqa0bM2RhpT27pkU2xpvHPaQqxKz/A7WssPmk68tUqqlhBZzsYyoEPZhsmjuGhKY014O7Qrp00vWwr7t0MeAnrrAuAWrpOjWgmaAepJgalks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kBdGJvI7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kBdGJvI7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FBF3C19425;
	Mon, 27 Apr 2026 03:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777261897;
	bh=9OUyQeeITyTHFWrfXU6VFeIRYwZiT6wNkksq/mESYrc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kBdGJvI73SuDrM6usrGN3P4Iz12lpxM1CROfTHYKBGngtpsWPHeiHhIZkr7r94WQu
	 QlxTuSQtedLTjkkTq9qMdrVtKtBL8ljuXqfFUO6vA0E4hB3WaSPNR+dawYtOKBYfaB
	 RBxTNDBZ0Ul8ZXaRZnzhH01Jwbgn2kbARImL8n1I=
Date: Sun, 26 Apr 2026 22:29:44 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: peter.chen@kernel.org, jun.li@nxp.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 3/3] usb: chipidea: core: convert ci_role_switch to
 local variable
Message-ID: <2026042606-plaything-elusive-592f@gregkh>
References: <20260423102002.2675414-1-xu.yang_2@nxp.com>
 <20260423102002.2675414-3-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423102002.2675414-3-xu.yang_2@nxp.com>

On Thu, Apr 23, 2026 at 06:20:02PM +0800, Xu Yang wrote:
> When a system contains multiple USB controllers, the global ci_role_switch
> variable may be overwritten by subsequent driver initialization code.
> 
> This can cause issues in the following cases:
>  - The 2nd ci_hdrc_probe() sees ci_role_switch.fwnode as non-NULL even
>    though the "usb-role-switch" property is not present for the controller.
>  - When the ci_hdrc device is unbound and bound again, ci_role_switch
>    fwnode will not be reassigned, and the old value will be used instead.
> 
> Convert ci_role_switch to a local variable to fix these issues.
> 
> Fixes: 05559f10ed79 ("usb: chipidea: add role switch class support")
> Cc: stable@vger.kernel.org
> Acked-by: Peter Chen <peter.chen@kernel.org>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

You can not have patch 3 out of 3 be only for stable kernels.  Please
break this up into 2 different patch series, one for bugfixes to go to
7.1-final, and the other for new stuff for 7.2-rc1.

thanks,

greg k-h
