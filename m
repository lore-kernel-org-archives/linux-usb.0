Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795132965;
	b=uDUckAT2BdvFXSXUvZcS5KxHr1/nnPWURb1mIQ2jnUitWoQVCtfkzAHKAU0ATwvBKrsq
	 yfVkCsE7bTW0jqPK0LRIcMVYP6eS7kD6Puq9GM9BVtxLIar8sLJYMM5fP4JfGCydKOQNX
	 Bwe+o8yNNBiMLSIaTGNwMC+qWSgB/FHte7hTp/6qp6wBRVvvfQ3Kg5qRdBnkexfcDdwdH
	 oLUd7iTVCCqf3BiApCRbi/5LCIGwXHMrJD2VBKRBOnHLCYLkSO5QZzB5HHhjXJlhq2uTB
	 B16z7h1sbAfYmjZ1eT2Qls6kXPwb5lvvEtXAy2UztwDvABhWL/u+pTcz+fFZIJU1QTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795132965;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=K7IiTNCHGCrw9b2iJV2J2quXWphsfMGnJj+bjDSU5j0=;
	b=QhL0hcHvGM9eCMX5Ed8qT3PysnROHeieZcIZ9CEYMos4f9zkXtErABjNN5JK+mqIgKnV
	 H+nivcFSlSz1uwwMXvAZetyp4+tw7EcSLoBq2P72Kh2jo5QXit7Vd9+vTyEZt3DKDnp4j
	 CWRurbZMlZ5l9ZgSX2ZGqV160JbMfU7IF/qenvVtuPLxlg3T9rIKkorIxK9HJoUoNuVMY
	 hVaMMmfjzXGtteIiaoO89JQPHXb56CdyFumwdqnSoe1JfCGRsRxFKIAX22gOq6DK2r/F+
	 RsQ30qflMGJPv93XGwCVIZTzyiwKoJj1+8d5MHxOqxWT4KdOfwEipTVhW23IDn+t0fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GOCj4taG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB06606A325;
	Fri, 20 Nov 2026 00:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GOCj4taG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 478021F000C4;
	Fri, 20 Nov 2026 00:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795132965;
	bh=K7IiTNCHGCrw9b2iJV2J2quXWphsfMGnJj+bjDSU5j0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=GOCj4taGw3irkEV7/TSd8yJmXclYrgwCNm1gVtRtPncKp/9tBdrrJbPMO21hHX05D
	 gQjoH+qG5i6JBWDPMRAy2Qmk00XtmbcvZtSg1QLO9OvRcanRAqRmxV7+i9fBOnRluZ
	 IKX4R7e/eSupBmeU43Qu9wesZa/XZoPHNRS++RuR51KYfm5XEThwLq2/CrFJC2AAQm
	 /GpaudBUHATU/OxyJdP0ioNlnrleZXcgvcNrZi+wd0HXobLqYTW6HC8Hm9BqVuHRyS
	 B3O5DNY2qmU5H8Rz+XJNmyoWiPobc+4wcnB1+uQeAT4Dl7itBqcUP93k345tu2nFUq
	 NCd/T8tMThWbw==
Subject: Re: [PATCH v5 2/2] usb: gadget: u_ether: fix out-of-bounds read in
 get_ether_addr
From: netdev-bot+sashiko@kernel.org
To: liuc63@xiaopeng.com
Cc: gregkh@linuxfoundation.org, akpm@linux-foundation.org,
 andriy.shevchenko@intel.com, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, khtsai@google.com,
 fangxy@xiaopeng.com, rdunlap@infradead.org, dbrownell@users.sourceforge.net,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
Date: Fri, 20 Nov 2026 00:02:43 +0000
Message-ID: <179513296378.3136.18205287276015126683@kernel.org>
In-Reply-To: <20261117090110.3263592-3-liuc63@xiaopeng.com>
References: <20261117090110.3263592-3-liuc63@xiaopeng.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The commit message is wrong about how the legacy module
  parameters report a rejected address.
- [Low] The ABI text this patch adds to configfs-usb-
  gadget-{ecm,eem,ncm,rndis,subset} says host_addr/dev_addr accept only…

--

usb: gadget: u_ether: fix out-of-bounds read in get_ether_addr

This replaces the open coded MAC address loop in get_ether_addr() with
parse_mac_pton() for the delimited notations and hex2bin() for the raw
twelve digit notation. This fixes an out-of-bounds read on short strings
and stops non-hex characters from being silently accepted. It also selects
GENERIC_NET_UTILS and documents the accepted formats in the configfs ABI
files for the ECM, EEM, NCM, RNDIS and subset functions.

Link: https://lore.kernel.org/all/20261106030605.576584-3-liuc63@xiaopeng.com/

> How a rejected address is reported depends on the caller.  The legacy
> module parameters go through gether_setup_name(), which keeps the random
> address that get_ether_addr() falls back to and only logs a warning.

[Severity: Medium]
Is this description of the legacy path accurate?

Nothing in the tree seems to call gether_setup_name(). Its only wrapper,
the inline gether_setup() in u_ether.h, has no callers either.

The legacy gadgets (legacy/ether.c, cdc2.c, ncm.c, multi.c and g_ffs.c)
pass the dev_addr= and host_addr= parameters through
gether_set_dev_addr() and gether_set_host_addr(). The KASAN trace earlier
in this commit message shows the same path
(eth_bind()->gether_set_dev_addr()->get_ether_addr()):

drivers/usb/gadget/legacy/ether.c:eth_bind() {
    ...
	if (!gether_set_host_addr(net, host_addr))
		pr_info("using host ethernet address: %s", host_addr);
	if (!gether_set_dev_addr(net, dev_addr))
		pr_info("using self ethernet address: %s", dev_addr);
    ...
}

gether_set_dev_addr() parses into a local new_addr[] and returns -EINVAL
when get_ether_addr() fails. The random fallback is thrown away:

drivers/usb/gadget/function/u_ether.c:gether_set_dev_addr() {
    ...
	if (get_ether_addr(dev_addr, new_addr))
		return -EINVAL;
    ...
}

The netdev then keeps the dev_mac/host_mac that
gether_setup_name_default() picked earlier with eth_random_addr(). Since
eth_bind() has no else branch, nothing is logged.

With this patch, "insmod g_ether.ko dev_addr=aabb.ccdd.eeff" no longer
gives a stable aa:bb:cc:dd:ee:ff. parse_mac_pton() fails the length check
and hex2bin() fails at the first '.'. Would such a user now get a
different random MAC on every load, with no message explaining why?

Could the commit message be corrected to describe the
gether_set_dev_addr() path that the legacy parameters actually take?

> diff --git a/Documentation/ABI/testing/configfs-usb-gadget-ecm b/Documentation/ABI/testing/configfs-usb-gadget-ecm
> index 732101ca9d0bb..076567aacf162 100644
> --- a/Documentation/ABI/testing/configfs-usb-gadget-ecm
> +++ b/Documentation/ABI/testing/configfs-usb-gadget-ecm
> @@ -17,4 +17,9 @@ Description:
>  			      - MAC address of device's end of this
>  				Ethernet over USB link
>  
> -
> +		host_addr and dev_addr accept a MAC address as six byte
> +		pairs separated by ':' or '.', in any mixture
> +		(aa:bb:cc:dd:ee:ff, aa.bb.cc.dd.ee.ff), or as twelve
> +		hexadecimal digits with no separator (aabbccddeeff).  Any
> +		other format is rejected: the write fails with EINVAL and
> +		the attribute keeps its previous value.

[Severity: Low]
Does this text match what the new get_ether_addr() accepts?

parse_mac_pton() only checks a minimum length and the first
MAC_ADDR_STR_LEN characters:

lib/net_utils.c:parse_mac_pton() {
    ...
	if (strnlen(s, MAC_ADDR_STR_LEN) < MAC_ADDR_STR_LEN)
		return false;
    ...
}

Its own kernel-doc says "anything after them is ignored". So writing
"aa:bb:cc:dd:ee:ff:00" or "aa:bb:cc:dd:ee:ffXYZ" to dev_addr succeeds and
sets aa:bb:cc:dd:ee:ff.

The hex2bin(dev_addr, str, ETH_ALEN) fallback reads exactly 12 characters
and never looks at str[12]. "aabbccddeeff.zz" and "aabbccddeeff0011" are
accepted as well.

The reverse case is also missing from the text. Both paths in
get_ether_addr() also require is_valid_ether_addr(). A correctly
formatted multicast or all-zero address such as 01:00:5e:00:00:01 or
00:00:00:00:00:00 fails with EINVAL, and the new text doesn't mention
this.

Trailing characters do have to be tolerated, because a configfs write
from echo ends in a newline. Could the text say that anything after the
address is ignored, and that the address must be unicast and non-zero,
instead of saying that every other format is rejected?

The eem, ncm, rndis and subset ABI files get the same text.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117090110.3263592-1-liuc63%40xiaopeng.com
