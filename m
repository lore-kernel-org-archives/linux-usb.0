Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D631361DB5
	for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2026 12:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790599699; cv=pass; b=Z1L/83eY9IKXVayAljvi40fGgaMZ5KGuGKneZORam87OHYdWzz6ffNCdOWGFOl1h63Pn2XcLb06LGmbkkffN8grR3QqHYfbQteWV67lfOcigbuop63vn2Ot0xlHRpQYnTqcoKQKMRxLwhPlWY6rtFLSVLZbCS1QxQfRNILTfptU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790599699; c=relaxed/simple;
	bh=VtrapI9aSL/wjLNn4f7jDjKgfrQd78FrazJ2iwbjVbI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TLQUmAvbr3Yo2V8eU6v+SLiwf3wRzUVxVd5PA0H/7wevEqflBB34mQ7v7jLdqouPnVPRRDo2I7KhU77/OROd1ks1A/4VX6bUeaiID5Qyi83nMovED+8r2so6f0ZIhBJWMCZ1y+HF0bi817NeudzTNGMLN/AnOpYnFEDiMCEWpUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cUVhF1s0; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cUVhF1s0"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33c11ef641aso3404409eec.1
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2026 05:48:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790599697; cv=none;
        d=google.com; s=arc-20260327;
        b=FcGiiT5tc3SarpD2xLI12hPeG22UshNIsvRIo+RZtWL8TdkJtj8v9eIAyfCeymVdKE
         6THG+GuIz5Kwq26k3Bz/9PUE6emtA+FFLXLhr5knPzAGCgGRX+Vf5l1sl5kXNZbymIeM
         7pRAIyCVI4uE8fxO54u88BuC1Kd4SmvRj6dH+Lf2NXreKkK4B7zqIuqj4xamJbCFfTsT
         KdUQD/CG+yOBmIWmWgUgh/fs8JEzJabm4SyN+BTgD46ob0CP96tqHGIH5y65KLUklXsZ
         vMfhDQF2YW6hD9HGGRMWmpfVAvF9oJfrQCZBuhUwkCFW8IMST0n0yTXkC7jLylPipclV
         TmfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VtrapI9aSL/wjLNn4f7jDjKgfrQd78FrazJ2iwbjVbI=;
        fh=dCZMPLcavW0SnYLfG5lvMQdbeVJjL+upZ1jA2rGkBOg=;
        b=bzBouQS2Jl2cgXns/qXWwZ+6eV8VVLx/FgJ8eFzRAJDQdjtOzKWf71KwxEm+f6FYv9
         SSZVpAuR9d7spvSL7vNrLduuluZv5r53fopQQEuUNLI4EiKAFp2DXMUzTAmG3kMQ4Sx3
         ElfApN5kuewv2TwPb5+UGMaSuvBNftvWjWqQM+FqcZp0cfaY604vP2FWtkGbS+TMG/Vg
         w+8mJjBazjxNs7aRFF75PlnlYBxk2/QEHbNbrIh7j5U6SxoXMaTxZFDYM0dVESqVsGny
         VDQuG5OUbGsEQY2tetiTod5Qaj5Jgk4VMDHjKP1IuYnbn9EqnRu/stKz35QOsxkzFQz9
         Altg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790599697; x=1791204497; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VtrapI9aSL/wjLNn4f7jDjKgfrQd78FrazJ2iwbjVbI=;
        b=cUVhF1s0sIPSXtPr9iIeeIBk/cxu/75YRWbbdDzmbe493Ax1gWDP+RFVW62IRBEEhZ
         rwx/BsdNhaeR/dVlEgE1Nqk2zN5zxfch99Zp4Lg3FKSTyrpAzVDRWjH6m68Zkx8D/8HH
         S7QnsQ1gvYfoGXhZkYwxJJ9p4wsNU8gHA5I+8lh4kEkujvl/aEsJObIuKcCj/7bBKdXc
         wjyfPsGH52bXmarRpmhAbt++GVh/Xx+zvA6C1iSOP0IMbKrTSL6ogE0ej63rHx5PWKhC
         FDsxSS0PRB3Yb4a8+YS2FJMcpskCSwgpdt70P5KEhiEBepQazjigT5XvoY1SPpDd/f7/
         W8Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790599697; x=1791204497;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VtrapI9aSL/wjLNn4f7jDjKgfrQd78FrazJ2iwbjVbI=;
        b=gXyZpXDmq0oA/f8PbyBX1rYFQBh0zADW4XnE3UJy6uD2aBPEhQAEq2cgF4ywH2AjcF
         jEAiLSQiRtkzaTw7ZaQpaYUUGx8RwLwILas/If1/5KpJS9Qi7f4lopRYn/nHZMNUmxGY
         6OAVF8elMZix6RBslwvmgXoyUlOId3ltclsNAkug0bjbY0Avop52Nxsn23ra5IGagINb
         QBg9FS2V3cUO/Xh0MQkEmhgRJDaDcFMMX4/7hA3gke50+eD+ABi0wbugqt3yJWOetPgZ
         srfbV3lJwFOZ7l2sPQhwLGMl1uLAqnULr3vVqFqm6lB1scZDHBlinERhAhH2Zvsr+k5w
         ZipA==
X-Gm-Message-State: AFq9FYLDS9jzNijuKgfh8e9d0om1wdiqc+WHpLuKI9RtlK3NpreBM/4o
	lqbHf5MxXghlS4zAZk0WyQg8tGVtoSQcyv/e2/TWdRuMTd2xl0m9/geqMeoduPU1fEpnUyQW9E+
	GuhvIJ8oZPQuW/Csc94P8DRNmP/ltHw==
X-Gm-Gg: AYBFou0acM8m8hKSCGZNDHG9sSMqbSrTxm8cGG5OMV8nf/dhwc+9JFlPAETtpWk3tkD
	2jw435FU79hItg3L8v7OUK84P3dBKBYPN/jIRf2KgObD5zppB0EkSf0JcYQYOxof8RD1V/G5bry
	RaOixoP+Y6zRwCqdnENWKAAuEam9AY72tffq2Q5b7m0+Iilyv4cFIcB4+a7WrvLRMWHbmewul+R
	1VhtS8Fc5vOk3MP+Ly3LYwLLbU9a39IKi4pJUQKuPDTQik2WXcVi3mlBmOatwjzaZZiMG0Mo59X
	6yoMmM4YYvO2e1gV5moqtzkP6sSBC2Jfl9iictT8t7PUufyWOIY3nlGWfVYmET3y2Y0bmVsz6C6
	s1TfzqZi6BEVs3hZ30SJoNhnm52Qy4FCd/vn5kw==
X-Received: by 2002:a05:7301:4d0b:b0:331:89d6:80e7 with SMTP id
 5a478bee46e88-342703c0860mr9551616eec.13.1790599696571; Mon, 28 Sep 2026
 05:48:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAM6_QD_PoTdwdM7DvzzgHRs-G5EvQu-c5oNGve=GuKV4wFYAvQ@mail.gmail.com>
 <CAM6_QD_xAyTFVvYKvCrrZmS+fV5DBBje9V=VdkDMMSpt2ussRg@mail.gmail.com> <20260928120343.49e02c07.michal.pecio@gmail.com>
In-Reply-To: <20260928120343.49e02c07.michal.pecio@gmail.com>
From: Dane Linssen <linssendane@gmail.com>
Date: Mon, 28 Sep 2026 14:48:05 +0200
X-Gm-Features: AclHuK8J3gRe-Q81xAxIPGhsJgUx0Z58Tt46aX_83uRYAf_M955FV41pJ0HJWPE
Message-ID: <CAM6_QD-CbYSsmic5LhpMi-aMXuC_VaniELBzaBeWO8SWm4UONA@mail.gmail.com>
Subject: Re: r8152: RX stops until rebind after -EPROTO on the bulk-in endpoint
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, netdev@vger.kernel.org, 
	Mathias Nyman <mathias.nyman@intel.com>, Alan Stern <stern@rowland.harvard.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks, everyone, for the quick replies.

Andrew:
As far as I can tell it isn't a regression. The adapter is new
(2026-09-17) and has only run 7.2.5 and 7.2.6, which don't differ in
r8152 or xhci. e765ab012f73 ("usb: xhci: Improve Soft Retries after
short transfers", v7.1) should make it rarer, not more common.
Bisecting isn't practically possible, as the stalls are days apart.

Michal:
> Out of curiosity, what's your xHCI chip?

Intel Sunrise Point-LP, 8086:9d2f (i5-8250U), so not ASMedia. The
other host with the same adapter, which hasn't stalled, has an Intel
Comet Lake-LP, 8086:02ed.

> As a bandaid, you could try increasing MAX_SOFT_RETRY or this:
> https://lore.kernel.org/linux-usb/20260905101837.4b7849c5.michal.pecio@gmail.com/

Thank you. Would you like me to try this to gather more data? If not,
I already have a userspace watchdog that rebinds r8152 when the LAN is
unreachable and the bulk-in endpoint shows virt_state 0x40.

> You mentioned using dynamic debug. Do you see "Transfer error"
> messages randomly during operation, or is it only one burst right
> before the failure?

I only enabled it after the two stalls I reported. In the 19 hours
since, including 71 minutes above 5k rx packets/s (peak about 29k),
there hasn't been a single "Transfer error" message, and no stall. So
nothing random so far. The next stall will show whether it's a burst.

> This should be visible with usbmon.

usbmon's debugfs files are blocked by lockdown here, but /dev/usbmonN
works, so if I have another stall I can send a 2 s usbmon capture of
the bus as well.

Regards,
Dane
