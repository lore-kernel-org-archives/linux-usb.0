Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1CA443AB9
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 19:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786390832; cv=none; b=YAFqk9Y4jGNh0mbV1vaO2/ygA+6IWOih88pyKVGF5LDrtlHDAoM9I5L0ErI+VRs4VfKkSFpuEgj3rIYLN2UeYt/m9vMKhrjMIc+VPhcqXkRb9o8JVqeOWLA+cT3QgTKrKQZX+kZHTtNUnUkl/GXysgf9BySeyMlx79Xy7o3ki7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786390832; c=relaxed/simple;
	bh=dIbNwkm8cBdP+mcdOHfBXQ6hTl2loJhd8a3LmBcNGZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MKA6aM8NWsElU8R7gIL7SSuPpxTztF+WwgBcbJjbEEQ3wnMcBIDuvcV79X/hipeiAxaA0Gaohz9GO/fDZ+UUY/L3SSVAFFcvjZFrd2sx5brsojW5V2vfanrDcxkMsuWX2ikgYt5bqU3t5L6d4KWzPmOd7yZiJdxziZQW4NPMF5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ao87SzkF; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ao87SzkF"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cad68425a7so2979355ad.1
        for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 12:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786390820; x=1786995620; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ddORqBUcuGJWiQXA7WqLuemHCzZ4dDqjxnXRbnxS+Ic=;
        b=Ao87SzkFurJzlu8WynI4H0frr+XgbulgBiCTFrKUqWzM0R5c7HBDPNmEZaNDhnylIZ
         LRawF2aCdcB8IkUp2iaAKxIdGT83p2w2CSGZoRbjpZqYL9rSv0W5d+bmnyy9Pt6GZz3y
         QqOQLnp8BZTHIVfTPBsqXmZFrHT/IoTfZ7Llvp19gErkParhJU7ZbaCcxEc7nOG+kb3U
         fE/WRfQp8Nf7xVCJFhjQ3OjrTwghHYW2sjlwFwzrMFO7FjVW/vPUxZIplW5I53tHaPNH
         o5iCqNPH8uCe4KQBQVe5eaC9wEN0x9U1k6HnS9+5Mt5WxN8Bw7604RewXpxtLxXSt66d
         NSTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786390820; x=1786995620;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ddORqBUcuGJWiQXA7WqLuemHCzZ4dDqjxnXRbnxS+Ic=;
        b=oTIl9t2fjVByAPD2vf2ahc9mqfP3Hej1l+98nc58aEKHJZkqOjfdoQwuTug9XFh5Hs
         /74KU10tLX4ymbeq2tnqvieOyDWEieyqtxg2OA6as5/WoDqXB7+q9C7c1evA3BE01C5B
         wXIN9Nb3NHZBPM4aAgOJzP37VRBrSXoKZJfH5axioclot6rIpPpyiYpW3hMgCIh+KRcq
         K2fJ6EumRVmPBpgvDB/1weBhCKB/KdEDi/RArURX9Z7jtA1lyONTOHsKvD7pHPCktTQ/
         Q7z8suPCvtOXWi3oL+8yBRtrrKOzvsY6wEJjwFdJwwY2qPFxmU62NLPHfiw7Xro2Xczc
         Uhhg==
X-Forwarded-Encrypted: i=1; AHgh+RqZsDonmdEGIV9L6AGO/DSOTm/i+POObVy/u1Y01YlxMSF4U1cMvToSW10wnPdnB/ux8Cn7XOrDLR0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFsoH54yoxSJu4046fzfrhj0zFwfPb4A2pwLKKjB1Q2o7R8PXY
	sV94OwEdFs/AqTzl3GG9lN3rQvsH0nTUsNV1I3MPi1DfjCky9sLU9kU=
X-Gm-Gg: AR+sD12I+E2gtfUbxuksAqonTLtvIDgk0fmx7wxGhSvNvq2G+uVqy0HP/UE/6xXvWU6
	kvJiiq8uzUXncvthdASOrdadQcHCg/HBt+gSeh2VT46RJipWrtJpZLfFC9RbWcqk7XQgCfaLVJ5
	TsgUwSH8iILgGYSAnpD7CRG5dlXcko3glUO2/9TGICXRBtujFTFErQ5jlcSYenkSw+3an+wkNPC
	wNIj8m4wQaif7m/0+1UxHYPMQIF2Aj0e/pTht7ACmyPIwj9SrLuz/Qo2BHHgo4WTPMjpr/09d3O
	z9vQcjdxqEIsSYvCTB6Jv1LRLoZaDYll+CZRFMbr/YSOhb7i/ljHpOAoA5wkjZWYI992+WLgSg/
	75VOpqxOUfhwGWa7Jqtj9cn9KWZw9t0nA3DPv9U+i0L2BEBt+oaeOCjklhooAPXfVcOugRNThdW
	1noXkgylf1A6cthPWddczTaenOccO5qA0FnTpm2A==
X-Received: by 2002:a17:903:32c9:b0:2c4:397:dd7a with SMTP id d9443c01a7336-2d0caa4978fmr331971225ad.4.1786390819961;
        Mon, 10 Aug 2026 12:40:19 -0700 (PDT)
Received: from matra.magic ([2406:7400:56:6dea::e95])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be8a9220sm48651371eec.7.2026.08.10.12.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 12:40:19 -0700 (PDT)
Date: Tue, 11 Aug 2026 01:10:08 +0530
From: leStoppe<lestoppe@gmail.com>
To: Huangwei@kylinos.cn
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: serial: simple: narrow OWON match to avoid
 breaking VDS1022
Message-ID: <20260811011008.0f7435c4@matra.magic>
In-Reply-To: <2026081002-helium-geologic-bb5a@gregkh>
References: <20260810091322.2201740-1-huangwei@kylinos.cn>
	<2026081002-helium-geologic-bb5a@gregkh>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Huang Wei,

     I've tested the patch and it solves the issue.

regards,
leStoppe
