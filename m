Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110203;
	b=xArHaOxp98L7p/e8bJo4LeMFgho7vZyRH1c+yDFlYbb+XO6LyWDJbZOHL8vzbOLYTp2C
	 vnooNVdAYOaad6y/r0xK70ZOywZIxC8pHiMq6ctGgAS0T9mAdDH4YEcfG+9zXZTLqhCL6
	 6L3dAb04wzXfAtG36OHrmzGEUPsZbuDSOLgiuvIzWJIO/6kWgvcDS/G8hUHN4QZjUY6zA
	 pfNCA/Dd5nBgXa7CdM0R1xjOkUisB/dwX0yBxC81WbzL2pTwaw0kNEsqzptETSbRvpE7I
	 lIDvQG95POuSi6N2GLMSHRb51Cgm8jQLIEjhDjTLQi/AW5R2f52tf6otnmXEGto47gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110203;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=XRZrlEcqQ8OtFJsj57FC7nhmEnMASVsrgPsXyeDJlKQ=;
	b=SDzXZVBWH0sKlQGaoE+ho7IZU/w0EnwgMyzkT8edwUWkVxqeZCqxktV8/4AQ1pbgwGbe
	 qb+ArQlIdFF1nhH/keqNuXhemVzil7OWzdLyID6u/K1s5tgvU8MnfDZS4W3OMJbDQTnBY
	 +D9V9aR4c+6noLgHNYgtsTE7sCByiPabB+ENGuLKa9cop/sdUUK7wiEBJraEgm8/njbNh
	 a9q+9TfduuVLsHbqRLYnXIZCXsJa4cPadNn/vGpIteg5NWjocHfyHMzV+5/e35I8IpyBx
	 yfBdjDSoY2vk6chMI58XBv1ekE6/ABxwNnPaw+ZHP8IiAelc3vazIrBz973/jUpj7dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CndfQu4j;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE43606A320
	for <linux-usb@vger.kernel.org>; Thu, 19 Nov 2026 17:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CndfQu4j
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B6EA1F000C7;
	Thu, 19 Nov 2026 17:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795110203;
	bh=XRZrlEcqQ8OtFJsj57FC7nhmEnMASVsrgPsXyeDJlKQ=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=CndfQu4jiHJXydE/sR1SxNjYbPtJehEVBWoKRLiLOqghltFxnSyn3oF62k8TS8HGF
	 HiZTSpG33HGyqv2kBPNy87oZyUFUFLvJO88yqn/6RZTchl1gXkaH02mxDB7RTW/cE1
	 FRGPzGZCEYFrvX3TUgT48j79BGNY8jruqhKQFkKswbkNr5Hn5UJ22lgskHNLs4YfcF
	 8I0/h4fGwBm53zbqvB+k0HOJlq+pXdS5OVPPfiPpWmZL/ycxuMJHMTpkL9mFTdwYrq
	 oIJCsi/I3c97WDRfY4o5thQFW34bGRu6Ha2JBwg92oMJjoLNDyujrpaJTo1RhHXXdr
	 vba1xkYK3XrUQ==
Message-ID: <sashiko-outbox-223717@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 15/18] thunderbolt: Rework tunnel credit allocation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mika Westerberg" <mika.westerberg@linux.intel.com>, linux-usb@vger.kernel.org
In-Reply-To: <20261119171232.1616316-16-mika.westerberg@linux.intel.com>
References: <20261119171232.1616316-1-mika.westerberg@linux.intel.com>
 <20261119171232.1616316-16-mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 17:43:22 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] thunderbolt: data race on port->credit_pool in
  port_credits_show()
--

commit c28526c3bb35bc796324ed492685bd1fa66796c3
Author: Mika Westerberg (Intel) <westeri@kernel.org>

thunderbolt: Rework tunnel credit allocation

This commit reworks lane adapter tunnel credit allocation to use per-port
credit pools with minimum protocol reservations and on-demand allocation
from a common pool, and exposes pool usage in debugfs.

> diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
> index 0d9f41a0f2cdc..eac6d564bf185 100644
> --- a/drivers/thunderbolt/debugfs.c
> +++ b/drivers/thunderbolt/debugfs.c
> @@ -2488,6 +2488,32 @@ static int port_sb_regs_show(struct seq_file *s, v=
oid *not_used)
>  }
>  DEBUGFS_ATTR_RW(port_sb_regs);
> =20
> +static void credits_show(const struct tb_port *port, struct seq_file *s)
> +{
> +	int i;
> +
> +	seq_puts(s, "# pool used total\n");
> +
> +	for (i =3D 0; i < USB4_CREDIT_NUM_POOLS; i++) {
> +		const struct usb4_credit_pool *pool =3D &port->credit_pool[i];
> +
> +		seq_printf(s, "%s %u %u\n", usb4_credit_pool_name(pool),
> +			   usb4_credit_pool_used(pool),
> +			   usb4_credit_pool_total(pool));
> +	}
> +}
> +
> +static int port_credits_show(struct seq_file *s, void *not_used)
> +{
> +	const struct tb_port *port =3D s->private;
> +
> +	scoped_cond_guard(mutex_intr, return -ERESTARTSYS, &port->sw->tb->lock)
> +		credits_show(port, s);
> +
> +	return 0;
> +}

[Severity: Low]
Can port_credits_show() race with usb4_port_update_credit_pools() on
port->credit_pool?

usb4_port_update_credit_pools() protects port->credit_pool updates with
credits_lock, and can be reached from XDomain lane bonding without
holding tb->lock:

CPU0                                    CPU1 (kworker)
port_credits_show()                     tb_xdomain_state_work()
  lock(&port->sw->tb->lock)               tb_xdomain_lane_bonding_enable()
  credits_show()                            tb_port_update_credits()
                                              ...
                                              usb4_port_update_credit_pools=
()
                                                lock(&credits_lock)
                                                usb4_port_remove_credit_poo=
ls()
    usb4_credit_pool_used(pool)
    usb4_credit_pool_total(pool)  <-- data race
                                                usb4_port_init_credit_pools=
()

A debugfs reader can observe transient zeroed pool totals between
usb4_port_remove_credit_pools() and usb4_port_init_credit_pools(), or
trigger a KCSAN report. Acquiring credits_lock when reading
port->credit_pool would avoid this.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119171232.1616=
316-1-mika.westerberg@linux.intel.com?part=3D15
