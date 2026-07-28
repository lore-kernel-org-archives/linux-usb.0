Received: from ixit.cz (ixit.cz [185.100.197.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B668D3F86F8;
	Tue, 28 Jul 2026 08:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.100.197.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785227163; cv=none; b=YIcdhSZr67XS9M0yr1+B/mOGVp5OdiXNQ0uVQNALvUlPjaRizoIaXX3Je1+dFbSl2iR0jeEH0eUgxSz0/CTRVP8A2tB286p8ZpbiuTnlbVTx/SMDpxVycRPb6tx1DFuhMWfAJh0MLx5V08GO2H68zcvWOv/ob50Pw0hKLU+vwNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785227163; c=relaxed/simple;
	bh=8eWXIphJ1zX30jaNMPkfNfHsBdWGEjJ8QXTl/PdqK4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nVujB9gFIz1mksu7FFlyAJCwdCGDg4xGRuQf3/yGVU+Il6f7D+0fVIVSINsE9geI9dG9FGrqK1J0y0LDLG1YFZrLUo2DBI2cFtzdttIdXPjx1gUlwfBk1wzr+pKkVafKLpvTWAs3cXzul1beuwVoUt7GULNPb5eRXwR0Ihbxzxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=xBhYc0Gc; arc=none smtp.client-ip=185.100.197.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="xBhYc0Gc"
Received: from [192.168.1.182] (ip-62-24-73-79.bb.vodafone.cz [62.24.73.79])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 471C0534021C;
	Tue, 28 Jul 2026 10:25:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1785227148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=PeJAasdWye57kwWlKWTNXy3TP2ONd5hEvvAE0ETpSYQ=;
	b=xBhYc0GcGfRG7CknQ8qkv6H3UpekavxXFh5QdJHmGtAqQZN3MFohBNjVsp6GIuRJ2BQnrK
	iDAAvjBX9NoJCOGoRgnCNQ17lKkV3auXMJoQZFEnNyQIMPEfxp+FAme4JuiaqS8JjQ0Lem
	NJtYkG9Nlvob/bU9RRhbFW6g9nGCVZo=
Message-ID: <f19752d4-6f4a-4719-a70d-c1948877dc82@ixit.cz>
Date: Tue, 28 Jul 2026 10:25:46 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] usb: typec: add Qualcomm PMI8998 USB Type-C
 role-switch support
To: taygoth <taygoth@gmail.com>, Sam Day <me@samcday.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-usb@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Casey Connolly <casey.connolly@linaro.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <cover.1779127507.git.taygoth@gmail.com>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <cover.1779127507.git.taygoth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/05/2026 22:22, taygoth wrote:
> This series adds USB Type-C role-switch support for the PMI8998 PMIC
> used on SDM845 phones (OnePlus 6/6T, Xiaomi Poco F1, SHIFT 6mq), which
> have been locked to USB peripheral mode under mainline kernels until
> now.
> 
> The PMI8998 SMB2 charger block integrates a Type-C detection unit at
> SPMI offset 0x1300 that performs CC sensing, debounce and Rp/Rd
> resolution entirely in hardware. The state is exposed through the
> TYPE_C_STATUS_4 register and reported via a single consolidated
> "type-c-change" interrupt. The new driver reads that status on every
> interrupt and pushes the negotiated role to a usb_role_switch consumer
> (dwc3), enabling automatic peripheral/host switching on cable change.
> Because the hardware handles the Type-C state machine natively, no
> software TCPM port manager is required.
> 
> The Type-C block shares the SMB2 USBIN region with the already
> mainlined qcom_pmi8998-charger driver. The two coexist on the shared
> SPMI regmap without write conflict: the typec driver only reads
> TYPE_C_STATUS_* and touches the IRQ enable bits at offsets
> 0x130b-0x130f and 0x1367-0x1368.
> 
> The PMI8998 USB OTG VBUS boost converter at offset 0x1100 has the
> same CMD_OTG / OTG_CFG / OTG_CURRENT_LIMIT register layout as PM8150B,
> so the existing drivers/regulator/qcom_usb_vbus-regulator can drive it
> through a compatible cascade -- only the DT binding needs the new
> compatible string added.
> 
> Power Delivery is not implemented. The PMI8998 PDPHY block at offset
> 0x1700 is register-identical to PM8150B and could be wired through
> the existing drivers/usb/typec/tcpm/qcom code in a follow-up if PD
> negotiation becomes a requirement.
> 
> Tested-on: OnePlus 6T (sdm845-oneplus-fajita) running Mobian
> 6.12-sdm845. A USB flash drive, USB ethernet adapter, USB WiFi
> adapter (TP-Link Archer T2) and a self-powered USB-C dock with
> downstream ethernet all enumerate through xHCI after the role
> transitions from peripheral to host. Repeat plug/unplug cycles drive
> the role through device -> none -> host -> none -> device cleanly
> with no IRQ stalls or stale role-switch state.
> 

Hello Максим,

1st, let me say happy to hear about progress here, I missed this message - due 
to huge traffic in linux-arm-msm*.

2nd, I have locally version which does work with DisplayPort (SHIFT 6MQ), does 
work with dockstation USB (e.g. perperials are recognized and does work), but 
doesn't provide power to the usb devices (haven't figureout, and it's more 
clanker work than mine here).

3rd, added Sam into +Cc, as he's interested in the pmi8998 too, plus there are 
others doing some experiments with pmi8998 in Matrix room 
https://matrix.to/#/#sdm845:ixit.cz .

What's your current state? Would you be interested joining the room and chat? or 
  we can do some email exchange of trees and work done :)

David


* there is phone-devel@vger.kernel.org, where this type of contribution stand 
out a bit, possibly for next iteration

[...]
