Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2917D318EE7;
	Mon, 13 Apr 2026 10:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776077872; cv=none; b=kzEHKpKt4jzwV8i9u15e2gxOgDNnMyKJAaWlbM72cSiy5hZV6NG85QMEU1BElWjONOqqK+qg1v3WW8HZq9F+Cm1M9w3vLKayboMMxOB06ROUJqX3gB2yH1bvlEcPLqO9wJlsAOcM/Ex0t3tx6aP3393CrtQbnPWPXFVz6UY0ubk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776077872; c=relaxed/simple;
	bh=rEMbzudmsD/Ya1O80dV5iRsZi+MxAj/TxZXg3yTLXlk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hi8bej9UxigkMBnneOR3YAz/IWpQvw+T790EuiPCJ5paSaVJEF5yKFeek8FKWsI7fzlsMz6XDblLKwukQWf2fGMZnKdQK4GjpOM7PHuD4faMku0VgK1zHPS5yH8Fgjr2UHzQ0mtiSdkGRbauk4E9Tbg7iJ7AgDSRJxZPiBsI8t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Bn845dOv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Bn845dOv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81A54C116C6;
	Mon, 13 Apr 2026 10:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776077871;
	bh=rEMbzudmsD/Ya1O80dV5iRsZi+MxAj/TxZXg3yTLXlk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bn845dOvssdgWYOQcLe4tR0YlF03pQvtFLF4zl9wYL9luEriRkZKW9a9IBSgQ8KF5
	 D/7mUGIFVbG7oTR0s207eM21SA8wJ4eEvwe8niCwVoOHdXqxHieRW1Sc9NFuTzm6Oq
	 OL5T43yiaOOymd/IK9L1KoapTK2P5oyRBRqeU1Ns=
Date: Mon, 13 Apr 2026 12:57:49 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Gil Fine <gil.fine@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFC] thunderbolt: Skip reading Rsvd SB registers on
 older-gen hardware
Message-ID: <2026041338-family-sprung-f69c@gregkh>
References: <20260413-topic-usb4_limit_sb_reads-v1-1-778a6eb37f7b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260413-topic-usb4_limit_sb_reads-v1-1-778a6eb37f7b@oss.qualcomm.com>

On Mon, Apr 13, 2026 at 12:54:41PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The Linux TBT subsystem supports hardware aligned with the latest
> USB4 v2.0 specification. In some places though, it assumes registers
> only defined in that specification version (previously marked as
> Reserved) are always accessible.
> 
> Every version of the spec states:
> 
> """
> Unless specified otherwise, the Connection Manager shall not write a
> register with a value that is marked as “Rsvd”. Writing a register with
> a value that is marked as “Rsvd” results in undefined behavior.
> """
> 
> The effective list of SB registers that need this guarding currently
> exclusively contains ones that aren't used outside the debugfs dump
> logic, so just add the required checks there.
> 
> Fixes: 54e418106c76 ("thunderbolt: Add debugfs interface")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/thunderbolt/debugfs.c | 20 ++++++++++++--------
>  drivers/thunderbolt/retimer.c | 11 ++++++++++-
>  drivers/thunderbolt/sb_regs.h | 11 ++++++-----
>  drivers/thunderbolt/tb.h      |  2 ++
>  4 files changed, 30 insertions(+), 14 deletions(-)
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
