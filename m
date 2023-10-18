Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71434A5B;
	Wed, 18 Oct 2023 01:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IcAEBV+b"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C892AC433CA;
	Wed, 18 Oct 2023 01:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697590823;
	bh=9bt1AZQZu+kPf7xfbsepDklv1R2kPXwB8sI4S2GxjkY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IcAEBV+bJY4o6YELr3D5GjVhcBkH3+RgMtRFVUdrwlN0uqNKKPp3JLLx4ukweuRSJ
	 aljDiTjH1+3xLaS470gaDntRsj8TaEhE29kSkqsQ2YyNv6o6mB6Od5Sw1T1cab/3bE
	 FZkXqsoVd+G35JCt6V8y2LKou7kH5T7fBmULVHQd4ZgK0zXA/qnlStxb6gbhDMDCKz
	 zB16A247svgCWCbnAMJm4SW56pd3MlKRtBI2RIGVlpx2p456H6nyFRGlCXVtjruMit
	 Llp3QfnvHNUPcMKptt6lvU+BHxk9JP2XZBdetiZSnI5QhnaamvXHbHmINu6KPEkW5L
	 QXcYm8qRIl+Pw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AEF30E4E9BC;
	Wed, 18 Oct 2023 01:00:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: usb: smsc95xx: Fix an error code in smsc95xx_reset()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <169759082371.18882.10002947976673675674.git-patchwork-notify@kernel.org>
Date: Wed, 18 Oct 2023 01:00:23 +0000
References: <147927f0-9ada-45cc-81ff-75a19dd30b76@moroto.mountain>
In-Reply-To: <147927f0-9ada-45cc-81ff-75a19dd30b76@moroto.mountain>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: steve.glendinning@smsc.com, steve.glendinning@shawell.net,
 UNGLinuxDriver@microchip.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 16 Oct 2023 20:28:10 +0300 you wrote:
> Return a negative error code instead of success.
> 
> Fixes: 2f7ca802bdae ("net: Add SMSC LAN9500 USB2.0 10/100 ethernet adapter driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/net/usb/smsc95xx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [net] net: usb: smsc95xx: Fix an error code in smsc95xx_reset()
    https://git.kernel.org/netdev/net/c/c53647a5df9e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


