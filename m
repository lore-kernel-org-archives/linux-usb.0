Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A952313535
	for <linux-usb@vger.kernel.org>; Wed,  3 Jun 2026 19:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780513326; cv=none; b=du6f/uYnQ6CqHvqYrD9egzXj4uZMTpvDWVwaJpEaoOkLvNxmaC/fBz7ZO3ZR0BZgklkxAe0Ci/eREM8dhjtiQep2vYpFuCOZ5d1e1ijpDkxpGs1sVpaCnimiYqxppgnfUYydK2cSG/BoMr6wKnv0xLQF2EDbQ31yk2eYhjklRzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780513326; c=relaxed/simple;
	bh=wIber/Kpyo8SormFTwrK9vf162VKrB5xwcoeDgZfv20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WNn9SRoYhxtsgEzm+azwvKNxLHmS00jXklYywWhwjYj4e1pFiiia10l44rgHho3IkUcByF7oVMNqhG3thXIgxS56odcjweivb1r9GxBIWQAStes0PUsYjmO4VCxCfjxWpkHAyRjmCrN6yVYFXzuOECzutM3xT4/lE70kzY6gt1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lEtt5qdx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lEtt5qdx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4424D1F00893;
	Wed,  3 Jun 2026 19:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780513324;
	bh=yOg/v5B5sLXABictXW0sBBlLppmqKqyHwwNjvSY+m98=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=lEtt5qdxurNoArUpp4MsKfh4ULvuyFRp8ZrVqKEUCcCJZsv2VNWyv3HPddDu42RhB
	 qrCNlJfXpUdibZN15of9GVWnWNpb0QPUnFfcXL+chXlvCbWRvfmibiI+1aYNzct0SP
	 D5iQB3+OTjMUtCedDL9NBcgsmFaSYg58S6qczFGjkq9M/KAsELC1xYmXEc/fII83q9
	 9vnhg24Tiy3w7hi/U/eRDAYb6bmIs0o67KV9eldJSh/VxvNjkCRyc2kvf2lXsIh91p
	 VAtxH+lWOAYv2LLbcWkOeMU1VIwaoivRdzJoJqdCAmZIM0HsHrqAlcBkhIEzX2xo2v
	 zNBn5YXDYo+FQ==
Message-ID: <041e5a5e-45c4-46b5-aba8-54efa85da6ac@kernel.org>
Date: Wed, 3 Jun 2026 14:02:03 -0500
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thunderbolt: Assert downstream port reset on shutdown
Content-Language: en-US
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, andreas.noever@gmail.com,
 westeri@kernel.org, YehezkelShB@gmail.com, linux-usb@vger.kernel.org
Cc: Sanath S <Sanath.S@amd.com>,
 Vivek Das Mohapatra <vivek.dasmohapatra@collabora.com>,
 "Kovacs, Alexander" <Alexander.Kovacs@amd.com>
References: <20260603180146.3949001-1-Basavaraj.Natikar@amd.com>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260603180146.3949001-1-Basavaraj.Natikar@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/3/26 13:01, Basavaraj Natikar wrote:
> On shutdown the connection manager tears down the switch tree without
> signalling connected devices. Thunderbolt 3 devices directly connected
> to a USB4 host never receive a disconnect indication and during shutdown
> this can cause polling the dead link for up to 60 seconds. On some
> platforms this behavior leads to a warm reset instead of a shutdown due
> to this timeout.
> 
> Fix this by asserting PORT_CS_19.DPR on each connected downstream port
> before tearing down the switch tree. This drives SBTX low unconditionally
> (USB4 spec section 6.9), causing the device to detect SBRX low and
> transition to Uninitialized Unplugged state immediately.
> 
> Co-developed-by: Sanath S <Sanath.S@amd.com>
> Signed-off-by: Sanath S <Sanath.S@amd.com>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> ---
>   drivers/thunderbolt/switch.c |  2 +-
>   drivers/thunderbolt/tb.c     | 11 +++++++++++
>   drivers/thunderbolt/tb.h     |  1 +
>   3 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
> index c2ad58b19e7b..52812908818b 100644
> --- a/drivers/thunderbolt/switch.c
> +++ b/drivers/thunderbolt/switch.c
> @@ -704,7 +704,7 @@ int tb_port_disable(struct tb_port *port)
>   	return __tb_port_enable(port, false);
>   }
>   
> -static int tb_port_reset(struct tb_port *port)
> +int tb_port_reset(struct tb_port *port)
>   {
>   	if (tb_switch_is_usb4(port->sw))
>   		return port->cap_usb4 ? usb4_port_reset(port) : 0;
> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index c69c323e6952..ca57b5181422 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -2935,6 +2935,7 @@ static void tb_stop(struct tb *tb)
>   	struct tb_cm *tcm = tb_priv(tb);
>   	struct tb_tunnel *tunnel;
>   	struct tb_tunnel *n;
> +	struct tb_port *port;
>   
>   	cancel_delayed_work(&tcm->remove_work);
>   	/* tunnels are only present after everything has been initialized */
> @@ -2948,6 +2949,16 @@ static void tb_stop(struct tb *tb)
>   			tb_tunnel_deactivate(tunnel);
>   		tb_tunnel_put(tunnel);
>   	}
> +	/*
> +	 * Assert DPR to drive SBTX low, signalling disconnect and avoiding
> +	 * ~60 s of link polling before warm reset on shutdown.
> +	 */
> +	tb_switch_for_each_port(tb->root_switch, port) {
> +		if (!tb_port_is_null(port) || !tb_port_has_remote(port))
> +			continue;
> +		if (tb_port_reset(port))
> +			tb_port_dbg(port, "DPR on shutdown failed, continuing\n");
> +	}
>   	tb_switch_remove(tb->root_switch);
>   	tcm->hotplug_active = false; /* signal tb_handle_hotplug to quit */
>   }
> diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
> index 217c3114bec8..875eb538eacf 100644
> --- a/drivers/thunderbolt/tb.h
> +++ b/drivers/thunderbolt/tb.h
> @@ -1102,6 +1102,7 @@ int tb_port_clear_counter(struct tb_port *port, int counter);
>   int tb_port_unlock(struct tb_port *port);
>   int tb_port_enable(struct tb_port *port);
>   int tb_port_disable(struct tb_port *port);
> +int tb_port_reset(struct tb_port *port);
>   int tb_port_alloc_in_hopid(struct tb_port *port, int hopid, int max_hopid);
>   void tb_port_release_in_hopid(struct tb_port *port, int hopid);
>   int tb_port_alloc_out_hopid(struct tb_port *port, int hopid, int max_hopid);

