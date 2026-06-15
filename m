Received: from mout-y-209.mailbox.org (mout-y-209.mailbox.org [91.198.250.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAAC30AD1A;
	Mon, 15 Jun 2026 10:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.198.250.237
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781521140; cv=none; b=kiQySkd/oGbfHKmlbIFawr+JRB7dBhkXUHxZOV1mujNu3Qapl29lEDp851Fc/c95auK7q6d/o5NAnQHHZuoepdBxpUPRt30UQu/scwXStDWpGA8omIbuvd/um39vvDL7oGZ+NDjsiYTpBdfbLiYDshq01wnn1bsRRi7l1fLx+lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781521140; c=relaxed/simple;
	bh=qkLOz8BFGD6OE1gBbId4XPWsUe4KgGN7l4XlOl7Gd1s=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=RBUZmAkLMwqC1kRpwBugqjwiaRTK425V1qPHXh9mwulW5EXqGJRX6JVaQg70RsA1dyfPXzgXASBXkJPyBuAHTkUvW8Yw73yMagu6qdlITeh/u6N+CZYKfiKejR5ggtlyzmdJpNaw23d7MWdpn+3lRPg+AFPUP7esxZOe5jZdLnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=p9kyMfzP; arc=none smtp.client-ip=91.198.250.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="p9kyMfzP"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-y-209.mailbox.org (Postfix) with ESMTPS id 4gf6Pw6nwTzB14X;
	Mon, 15 Jun 2026 12:52:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781520725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DNBH2K03g05Hq1hpu70f2ZScBCxnub6UyQBbCoNr07I=;
	b=p9kyMfzPMBewXA2hZ9xfZJobNCivzbME8HvALDOZeohXedPBcyxy8ccadbEjTCLqULBVDM
	nk7IsOlr38w5FCJ00RIWQwWIwZIaXw/uqwMELuYaf7nId8nrFZNEdDYY3MRrli+23TSkHY
	Hk5WLWxqbSs3cHJQiK8oTTTsHS1WW/LArUQBFfNM6MdwWQcl9Open5qL1vpgPo+plvZo+L
	6zq4t0b2ATKIjwRdYjuGir9cTtHPyWfu01WxneaFfdYI1/s6nNhQ7PzdvmFhpnMKZmj/tP
	5pYZSc0cbWilxRxADEyTLuQC4lwbJTdZmV2Jjy8rUKgN9Znw5/qZqQqTIrZIHA==
Date: Mon, 15 Jun 2026 18:52:01 +0800 (CST)
From: Ming Qing <a0yami@mailbox.org>
To: Peter Korsgaard <peter@korsgaard.com>, linux-usb@vger.kernel.org
Cc: julian@jusst.de, gregkh@linuxfoundation.org,
	Pavel Hofman <pavel.hofman@ivitera.com>,
	linux-kernel@vger.kernel.org
Message-ID: <6564238.328878.1781520721949@app.mailbox.org>
In-Reply-To: <87zf0xmpfv.fsf@dell.be.48ers.dk>
References: <20260609091957.2716984-1-peter@korsgaard.com>
 <87zf0xmpfv.fsf@dell.be.48ers.dk>
Subject: Re: [PATCH 1/2] usb: gadget: f_uac2: fix memory leak in
 UAC2_RATE_ATTRIBUTE store
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-MBO-RS-META: yzapo8ghpgkcscrdegfe784i85sgp37e
X-MBO-RS-ID: 05b6df8f41ca0a1d0f2

On Sun, Jun 14, 2026 at 5:39 PM +0800, Peter Korsgaard wrote:
> FYI, I see the same issue is also fixed in the recently proposed
> "[PATCH] usb: gadget: uac: validate rate list length before storing"
> 
> https://lore.kernel.org/linux-usb/20260519143319.147494-1-a0yami@mailbox.org/

Yes, that includes the same buffer lifetime fix. I'm happy to split it up if that makes it easier to pick.
