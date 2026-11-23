Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446703;
	b=eaU3+wuvi2WsP34uHDn8w4sA0CmuxFPCzvTXdF5Zp507R8CkJp0bNWPGVE1GYuwiCFDC
	 I0SATgard6LJcDwyVEJVgG2TAJOxstk79t6kEUGb9KndREwLN2b5nx2DhevCN3yOSl+6s
	 T0n7kKAt10UYk3OTGZueiIesUHtzE1vFnyQHl6kfHmzRWHL7y/fZK/wlWbNMOyDfHBksX
	 OXdqwo752DZ2hI9Xp/0VV1L3fzPKFFs20Yta7Nzloy2R604nbncn9VbNgEkZ0qQ7DmOUK
	 xnqLxurxn3Rm0XiKc2r+ZYt1WFVg0K355e635EXhmrhDqszfV7e6W5REtf6R6vZPtNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446703;
	h=Received:DKIM-Signature:Date:Content-Type:Content-Transfer-Encoding:
	 MIME-Version:From:Cc:To:In-Reply-To:References:Message-Id:Subject;
	bh=qedVrhq6D8yXZ08FWvsn8UPMBlUAfXLJ/UDjf19Vavg=;
	b=X6K/sSh7cvV96oC8DzbLUFvBzCfjVW6yzWVVsVc/XyPGerXeO7aPn7xpB7A9LorxUNI8
	 rFECkJeHoX9/5g8rmx4sXC4kPE0PQL+Vsu2op0XscJKmnLsFBwkG/O+5h7pfnUyXhukye
	 eKeeZAL6Ji33fCxHKUQYTa/863apGZIhzCNJiGtY/XueAdvAFMTFu16r3dyveCimnywWh
	 pKfaX1gdmzqR/q/zzzBJztdL4vVaIiDa4kbI7lH3H7/4HfVboA+hR0BkWPeVkC0PwaoU6
	 0soafNespO/avKw7A/xnscnG1G0PNLMHENruaxBX8/RxL0gsjzOrLIlaHYE9aV7quTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DvMfOoMM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851A8606A327;
	Mon, 23 Nov 2026 15:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DvMfOoMM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27CE41F01574;
	Mon, 23 Nov 2026 15:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795446703;
	bh=qedVrhq6D8yXZ08FWvsn8UPMBlUAfXLJ/UDjf19Vavg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=DvMfOoMMUl/SMHQ93v4UNM2/f51C6gWbHw15TggSVxgmPNhjtnokXHhj6EJxl0edp
	 2cHzrulaq1+XOCdR3HwaRb+wyR+CrbDwyZhbVvfaCgBTXdIlmNJX153opNRXVmpGRg
	 /E5OV+ubV8ibFseOELosoRyDkEHpVxxcYNmNodvxaZwQg3K8Uw3tPmj6Wvf8eIJsHa
	 AVJtLmFAsZ8J/BW+4pg8hoYgvE3fFbn2XKdpPRnmPZZHL/tApR4rDN9DCaRkuv+Pg7
	 43wyBDDQAWV/j3YbVdA5lLBzIp7eKF9daGg5E0KRRrSHnzlAKHdLNPiOtO/cOGa0xH
	 307efp+nH/UEQ==
Date: Mon, 23 Nov 2026 09:11:42 -0600
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
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
To: Akash Kumar <akash.kumar@oss.qualcomm.com>
In-Reply-To: <20261123091024.2214918-2-akash.kumar@oss.qualcomm.com>
References: <20261123091024.2214918-1-akash.kumar@oss.qualcomm.com>
 <20261123091024.2214918-2-akash.kumar@oss.qualcomm.com>
Message-Id: <179544616363.2477641.14590053759680367457.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: cypress,cypd4226: Add
 orientation-gpios property


On Mon, 23 Nov 2026 14:40:23 +0530, Akash Kumar wrote:
> Add the optional orientation-gpios property, used to sense the CC
> orientation of each Type-C connector on boards where the CCGx chip
> has no HPI register exposing CC polarity. Entries are ordered by
> connector number; an entry may be left as <0> for connectors with no
> sense line.
> 
> Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/usb/cypress,cypd4226.yaml      | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Lexical error: Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dts:84.49-51 Unexpected 'XX'
FATAL ERROR: Syntax error parsing input tree
make[2]: *** [scripts/Makefile.dtbs:138: Documentation/devicetree/bindings/usb/cypress,cypd4226.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/linux-dt-review/Makefile:1716: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20261123091024.2214918-2-akash.kumar@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

