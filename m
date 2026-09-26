Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74EC385D69
	for <linux-usb@vger.kernel.org>; Sat, 26 Sep 2026 17:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790444490; cv=none; b=NjoMeXIR1ehnYeTNOnG6fE/0e3W8vUz6W9yrXBKv+2rGJhyDpaK+asjrCkomOOfs6uiGucf56EpZFtNIDs0f8hUxZb8JucZDz1ORwwpvLy8hM9Uds7hITPGFVnCMs9F0RwkTJwtQ4rJhJXZHA/jZ/uT/F5Lg9pPX0yryF/ZmjD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790444490; c=relaxed/simple;
	bh=HYwyke1JLS3FolxgV4a8QROiZLzIibwd2AXWkbTUK0w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rqYEO9Ngv4d/o9CeFzX8FSbhiFqxqWxB6G4aKzBVlGtfl+UnGO+iqw8Mvsbvc1DQdZytSqHflj84XHUwIaDMT8Of4TCPagEirThblqQJqyNvR7NqUE28XBam5tPmhfVvi6KCGE0pVeuuIUoLYu1joDujuE7gF0IWxRZKCScDlAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ND/v6Gh9; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ND/v6Gh9"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485984ebf5cso1405118f8f.0
        for <linux-usb@vger.kernel.org>; Sat, 26 Sep 2026 10:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790444479; x=1791049279; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F0dgyup4al/3sV3lz71+0/7UUaNAxIML038wS9yHKsE=;
        b=ND/v6Gh9ZZQ4CacnKNWGbkr52ypfvlidUKJawTc+AePlnGMOjRDQySADHTgPwVSttr
         CDDTCvYSFamUxaqsrrdjlsU8JbXAEg87r3IZ41pUvO101JivK1yfk1D4OObHHxQZZ3fz
         FNwrukisP8diLALUClHLp+tL8Z1BMj08dEAQvZydBr1VPQidTUOYgFG4RlK/Oi2VgELj
         aSyB5Ws0TlXYXgeEcDgn5ZlVaT+8lkIjHaPQDG3ywPn5WYaVwsqEa5z7e7Gi3ImYbnKW
         jictDWcQFRVZRTBeY5GGvQYWUcF4iCUnObbSnF0YutR1BIB7ka/5v/wz6MKj1IKl8BBF
         Gung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790444479; x=1791049279;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F0dgyup4al/3sV3lz71+0/7UUaNAxIML038wS9yHKsE=;
        b=2UkQq2RdK82rYe3LFAOuA+/eWPnQtibiP6lidRxN3+/NWqh5XEJOu1ZI2vSvp1b8BV
         FCr+cUqH1ebrTMPp0rMY/weize5A/lq6/exf9sCCSO4kjvDWAl5amxjeAo6zSwhITpBw
         NOenb8XBGSF5WQ+tj0aA28nXDTcOzX3TOsTY4jvj+9SH+unzqkOtiJoMt0sepsY9cwqD
         ScFAmqlM+y8zxhbFxVuj2RUzAT3NA2Dr+OyOGH0AcFma5Vvq7L+yS2gX9evr1erLb7kP
         MKS2CaagGIlHL6jepjaMnJqYcNyz33lSO1bJgHE17Td5ofukONy7pg8Rwd41NMlhPKjW
         4OBg==
X-Forwarded-Encrypted: i=1; AKwUvBz08Ms+SOVdsdWV/99SrpYStd7o6cqnOhtPIT8CxZWVz0gMA1ZmZ69a3W3oJsjpOwndmW9mzjedxKw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgH7lhBUgLPPJIuuyULJjeLvv+12H8cU9tBD9qLwcB8WK6Cbiw
	rxOzDm2tx4aDYyr16Dq5v2LaaE0nOQJMcS66F00jgU6NisbfL96Qf9Ij
X-Gm-Gg: AYBFou2soRDix8VEl067QZBfZ3W88jzdvdiQ8CKGB9X+9seYTfee3qep0PIhi5M9VuI
	l98wG3HsZtflJDL5mRSAmRCasSExb5fgU8yoOgng+WlB0Yp7QQ1Mg8bzpZAOmRorPAukcHc0qPw
	7UqD23mBMuYul9QJKDmMvNBABByM7jpF8OqWpTledxDnRS0HKfZH5tczZZgC7ZPdidaCKXql+k1
	bJ9uSNgLcU1/ZafZ3s/FCPl3COvh8SVoMPQNzjVSiLa8ABzmQR6xn87IQZYGNfVhMQ+itkHXFv/
	9AnJSucGbUb9P2iivTiVW6K7DYJJajbUxriJNnDp9gWA1/kWrXwlgBI5gMCLioVhIzzP9KVcFhQ
	IGN8y2IJkB8e9r+q7/5OW8S17F+RRYrrbN6ga4uRiMZITgfLWfqFlGdsawvDpXpu6TaDciVrUjZ
	Z+uUNcAjd7PSfq8t2g3qBlQl3lCBjeIAy8sPl4BkkvpvWQLYIKtpyefU11hswc26aUsfgJV4dTC
	MaTuaQ25A==
X-Received: by 2002:a05:6000:4908:b0:487:2805:6834 with SMTP id ffacd0b85a97d-48872ac763amr16662943f8f.42.1790444478572;
        Sat, 26 Sep 2026 10:41:18 -0700 (PDT)
Received: from foxbook (bez152.neoplus.adsl.tpnet.pl. [83.28.37.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a746c57sm14400223f8f.35.2026.09.26.10.41.17
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 26 Sep 2026 10:41:18 -0700 (PDT)
Date: Sat, 26 Sep 2026 19:41:12 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Ben <benstaples10@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Mika Westerberg
 <mika.westerberg@linux.intel.com>, linux-usb@vger.kernel.org,
 andreas.noever@gmail.com, westeri@kernel.org, YehezkelShB@gmail.com
Subject: Re: xhci_hcd 0000:0c:00.0 dies with "Abort failed to stop command
 ring: -110" exactly 24s post-init, tunneled USB4 xHCI behind Goshen Ridge
 (ASUS ThunderboltEX 4) + CalDigit TS4
Message-ID: <20260926194112.6257770e.michal.pecio@gmail.com>
In-Reply-To: <CANcA1gAzBk_r88WRMsYARtEo-MpX_Bz=uUKqut_rTJAMYm6ufA@mail.gmail.com>
References: <20260915043845.GG106095@black.igk.intel.com>
	<20260916075135.GN106095@black.igk.intel.com>
	<CANcA1gCjSCdXz_3+XA5ZOndm2pAL4ZUs93q_69dzZeq_cmq8Og@mail.gmail.com>
	<20260917043847.GV106095@black.igk.intel.com>
	<CANcA1gDFygEN68vnoocpLg10jMQctb3aG_QU55nZK3GuxSrD6w@mail.gmail.com>
	<20260921044453.GJ106095@black.igk.intel.com>
	<CANcA1gA_o_34UUZMzFp+cMuMFvk9S4uizYCdR8iG55pKaw+71A@mail.gmail.com>
	<20260922042608.GZ106095@black.igk.intel.com>
	<CANcA1gAijg6Ftmw9+aeuG+SjKKwKo-HyXb+kfBiGFGj=ZzNvaQ@mail.gmail.com>
	<2a4026e7-f5d3-4301-bc60-0570cbd7fa09@linux.intel.com>
	<CANcA1gAM7UsSxNyHET7HZndeWzAnf4yBDdhLC4pRFsMNuWOHgQ@mail.gmail.com>
	<20260925102746.25e87ef0.michal.pecio@gmail.com>
	<20260925104013.1c8e21cb.michal.pecio@gmail.com>
	<CANcA1gCRveYso4ishW68P_2N3z0pRYevAwShS_VRNQLEMKJfQg@mail.gmail.com>
	<20260926103708.0025dad2.michal.pecio@gmail.com>
	<CANcA1gAzBk_r88WRMsYARtEo-MpX_Bz=uUKqut_rTJAMYm6ufA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 26 Sep 2026 09:59:01 -0400, Ben wrote:
> > Was USB functional at all? The patch would break it. Maybe it wasn't
> > ideal, please try this revised patch which only touches the suspect
> > host controller. And don't use xhci_hcd.quirks=0x800000 anymore.  
> 
> USB was not functional on the initial patch. I had to get the dumps
> using SSH. On the revised patch, it was functional.
> 
> > Please confirm that the string "beef cafe" appears in dmesg, this shows
> > that the patch is applied and it recognized the suspect controller.
> > Then check if there are any "AMD-Vi" errors logged, particularly at
> > addresses 0xbeef0000 and 0xcafe0000, and check this:  
> 
> Interestingly, I could not find 'beef' or 'cafe' in dmesg in the
> original patch. In the revised patch, each was present in one way or
> another.

That's odd, because the original patch log shows no IOMMU errors from
any controller, even though all of them were programmed to read bogus
pointers and some (presumably?) had devices attached.

I also see no usual "Adding to iommu group N" messages. Was that kernel
running without iommu=soft or similar options? Was AMD IOMMU support
enabled in .config?

Regards,
Michal
