Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8D63612FE;
	Sat,  8 Aug 2026 04:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786162918; cv=none; b=e7s3O/7MhKwXXgvNh5SRWbvdaJT4rzMRGDErCPHbPWdtOaGFMGit9ubCKqSTdu8S1KzluVmZ64VAS0rKXmHoTyNuicm+rshZve7VkMR0jgW9C3eHIBS5lQvRP1iYfwUSOWEIKK88G3le9t9q8eHiJbwNeIpKXc08covNiFbVjQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786162918; c=relaxed/simple;
	bh=jgd666ZsIlwVOC9npSEOGg61PdXnU8bW+3OyYPQQ2MA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g6ZFZusBx9Ytx295ytK0HSvQ7mLCPgSq37kWtwVYbrmVOTfM77Fr6xMwNlK6q35io3W60AweDJXfKMjDNfQS0MnAGZEQYrt9vf5BLyyd4FgHcNlta4E1UtZKzf+tdiTp2TuIxt+x1NrAfDkNdcOpBvcRT52LnaOE5e+w41DXJJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=f0f33aTI; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="f0f33aTI"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4hH7Bh3jRtzMlH4;
	Sat, 08 Aug 2026 06:21:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1786162908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lPRMczOnzvQyTCVwnpWM6nSAp6obL+qHV5cMgjWSuwI=;
	b=f0f33aTIq8s4ZqkMAaEy4b1Sd85jXd5RXh7nXN1G3CWYWgAYnb19L76ZktTaJIFIRag8VO
	O86MoMxxT9e/aTm3REnzKSuHHHLTlvAyV1xJoJc+aWslkTW5iubM8G1ZRrVLkS/AtyG7GV
	04rkxlnofvfm+BMGHBXx/N8fDGVq+/9nQVFX9N2VVnI8m6n35mDD41MxE2hTNlccLVf76c
	XnCaNG4JtSuEUUOvcVRqmYUojjHP1711RlZ12r+kwVFg6am0I4bVkUJcdFlUjPXelfT2np
	WL8vELagNOJ/dud86QEaYyEhMJKKVb73Kv0ljcmK1FU6TXZzBcYXI00DKSWPdg==
Message-ID: <2b5e81da-4a62-4665-8476-f361cd0039c4@mailbox.org>
Date: Sat, 8 Aug 2026 06:21:45 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: dwc3: Document Renesas R-Car
 Gen5 DWC3 xHCI USB controller
To: linux-usb@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260806050422.324435-1-marek.vasut+renesas@mailbox.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260806050422.324435-1-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: rfgngqqr6i4qdd1zf441mmwuq9jfac9c
X-MBO-RS-ID: 10e5f276f7cc3e07f00

On 8/6/26 7:03 AM, Marek Vasut wrote:

[...]

> +  phys:
> +    maxItems: 1
> +
> +  phy-names:
> +    enum: [ usb2-phy, usb3-phy ]
I will be adding this change here and will send V3:

    phys:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2

    phy-names:
-    enum: [ usb2-phy, usb3-phy ]
+    minItems: 1
+    items:
+      - const: usb2-phy
+      - const: usb3-phy

