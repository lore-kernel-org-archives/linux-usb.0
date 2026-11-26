Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795672288;
	b=mpHrjniLHGIHjyPG+VHLcdJHZ555YizZKVX5fxXtQHQ/Po4Ku6x+H2eCL/mbYu1WOhcx
	 /E066Ijrn15LzfklvINDbxHn3c70yb3NfogYH5hNrzwVuVITxQcIOWDc4V05hRspI7s/y
	 kqUt+VYStXNUHnM5kPd4J1EVfijX8T26uJVOSOkS90BojaHNEbcrcqHE5At3mBjyWo67A
	 ZjNF9asUsfiBWzaAgx96dJkMBQoPqak02J1t685aG1Je8Yvk2/klR8wrW3DOq3r+XtLpl
	 iUnlHrLClAJB+NqJU7Y8L2E+oLUWboKxdPyK85+jFrScBhOQTA5LE1Bc7Jzehm+X5Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795672288;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=HoLbLq9QRldxYKWRHOssa33uAoW/e56PGP4SD+reeog=;
	b=NOXA7kxR4z8X3qOcVbfWbC/uMaSI5k5bvpqrfxfznbuX5Mg2p9cRw/anLv77ViWAtF8x
	 8m0Hn7/gHcf170EEm2tCk9WXE/6ihRZh6Nn+QntG01xhSYKOgYRfI0O6/xbJTx5f1C4ld
	 iCi/qNgumL3hck3sqGeQBlIVWSblIkcAof77tGvOsk0r6InzGzvH2bJfHVGfvIPsRZybo
	 3YhVEY+UpU5GjcymKo6QEKZ7bZzRhYYulMYt+NUmrLiSVWs5dpLB+AP2WaBxpbh4V4bXc
	 GZTtFPWQlOk7aHjh1WM9vMR1AIJRYYKs+dwEH+fHZdvI6ipk+3w6zusu52B1NQCdsNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f73SdHy9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB66606A31C;
	Thu, 26 Nov 2026 05:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f73SdHy9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 003491F000C0;
	Thu, 26 Nov 2026 05:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795672287;
	bh=HoLbLq9QRldxYKWRHOssa33uAoW/e56PGP4SD+reeog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f73SdHy9CCJq8yaqchYXKUPuqXhIwtGpTwM5Flzz32zbBGS+kKUMDZNXF/Gqut5bj
	 QmGz401hBQ23fJt4MWBqoAkxEIXKhcgau7G452Hxs7V7ozg6Wr9YrvluKSC2/+L9VZ
	 b5QvS+NcTBtDq3lCjVHV3MLRL7bTZYMCY4LEFNKiKofBfl5+OW0OVXHnclTVFsIUK1
	 SVXRMXG6N3cg4t1Gb3ttj3Wqtt+FmQq/0v+e6aLeUxYMGWhHcYW2mPeG2gtvnmp3ep
	 5yxBJcAN/jREAe+mDKz6AiauRNixfUFxTOcA7pb1S4/41SA2fON+5+K7OZUdgWCx8n
	 PD9Ub5ycnMLUQ==
Date: Wed, 25 Nov 2026 21:51:25 -0800
From: "Peter Chen (Qualcomm)" <peter.chen@kernel.org>
To: Xu Yang <xu.yang_2@oss.nxp.com>
Cc: gregkh@linuxfoundation.org, alexander.shishkin@linux.intel.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	jun.li@nxp.com, imx@lists.linux.dev
Subject: Re: [PATCH] usb: chipidea: stop asynchronous work before destroying
 roles
Message-ID: <awfI3W8NDmuasHEE@hu-petche-lv.qualcomm.com>
References: <20261112092556.2747348-1-xu.yang_2@oss.nxp.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112092556.2747348-1-xu.yang_2@oss.nxp.com>

On 26-11-12 17:25:56, Xu Yang wrote:
> From: Xu Yang <xu.yang_2@nxp.com>
> 
> Role teardown currently removes the gadget and host roles while OTG
> interrupts, FSM processing and work items may still be active. Such
> asynchronous processing can queue or execute role-switch operations
> against partially destroyed roles. In particular, a gadget instance
> may remain registered after the controller has been removed.
> 
> Disable power_lost_work before starting role teardown. During OTG
> destruction, disable the IRQ and ci->work, clear canceled ID and
> B-session-valid events, and remove the OTG FSM before destroying the
> workqueue.
> 
> Finally, destroy the gadget and host roles only after the OTG machinery
> has been stopped. This establishes a teardown order in which event
> sources are quiesced before their target resources are released.
> 
> Fixes: cbec6bd55a45 ("usb: chipidea: move otg related things to otg file")
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Do you need to Cc stable tree?

Peter

> ---
>  drivers/usb/chipidea/core.c |  5 +++--
>  drivers/usb/chipidea/otg.c  | 17 +++++++++++++----
>  2 files changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> index 3461dd763a6e..eb7b9c0746d8 100644
> --- a/drivers/usb/chipidea/core.c
> +++ b/drivers/usb/chipidea/core.c
> @@ -942,10 +942,11 @@ EXPORT_SYMBOL_GPL(ci_hdrc_query_available_role);
>  
>  static inline void ci_role_destroy(struct ci_hdrc *ci)
>  {
> -	ci_hdrc_gadget_destroy(ci);
> -	ci_hdrc_host_destroy(ci);
> +	disable_work_sync(&ci->power_lost_work);
>  	if (ci->is_otg && ci->roles[CI_ROLE_GADGET])
>  		ci_hdrc_otg_destroy(ci);
> +	ci_hdrc_gadget_destroy(ci);
> +	ci_hdrc_host_destroy(ci);
>  }
>  
>  static void ci_get_otg_capable(struct ci_hdrc *ci)
> diff --git a/drivers/usb/chipidea/otg.c b/drivers/usb/chipidea/otg.c
> index 89a6a37815f0..8ac8969a45f0 100644
> --- a/drivers/usb/chipidea/otg.c
> +++ b/drivers/usb/chipidea/otg.c
> @@ -272,12 +272,21 @@ int ci_hdrc_otg_init(struct ci_hdrc *ci)
>   */
>  void ci_hdrc_otg_destroy(struct ci_hdrc *ci)
>  {
> -	if (ci->wq)
> -		destroy_workqueue(ci->wq);
> +	disable_irq(ci->irq);
> +	if (disable_work_sync(&ci->work)) {
> +		ci->id_event = false;
> +		ci->b_sess_valid_event = false;
> +		/* Balance disable_irq_nosync() performed in ci_otg_queue_work() */
> +		enable_irq(ci->irq);
> +	}
> +
> +	if (ci_otg_is_fsm_mode(ci))
> +		ci_hdrc_otg_fsm_remove(ci);
>  
>  	/* Disable all OTG irq and clear status */
>  	hw_write_otgsc(ci, OTGSC_INT_EN_BITS | OTGSC_INT_STATUS_BITS,
>  						OTGSC_INT_STATUS_BITS);
> -	if (ci_otg_is_fsm_mode(ci))
> -		ci_hdrc_otg_fsm_remove(ci);
> +	if (ci->wq)
> +		destroy_workqueue(ci->wq);
> +	enable_irq(ci->irq);
>  }
> -- 
> 2.34.1
> 

-- 

Thanks,
Peter Chen
