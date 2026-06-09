Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FC436680F
	for <linux-usb@vger.kernel.org>; Tue,  9 Jun 2026 18:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781028391; cv=none; b=hbR57Nsu3kfY5RLZccxWUYwQv50L+fq49S0DvsSw9txrPKxFv8fzchUd6FPjBtVoe1F0DxMYBtjq9EehOtC+VqaZV7SsgEbqtE8vnPDnzTmsJNIJ/q7wdiEhiPhBcwmfPoJITii65FN+lKLltOzkxdwZsSaalFOASZiayBCtCZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781028391; c=relaxed/simple;
	bh=77r4mWNCjEmS8ZoX+7M4X+reZFu9QAeAtNsZ2NyXcXk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lS1OeSWKF0pB+fT8sfTCyFMdUr9HkuhcQrOnKAFDMrUHEfPHjDVQBNZA8u+i4diVjEWvDakDDz0FrxxrtznihtSMjOfIZDyglDR1hgswygxzNooGt7HgCCKWJq32qvN5fZGMFA68Uo4WGQb+gCehSNKFdpNi1Z75xb6ldXW+UXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=Ex9LSYHx; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="Ex9LSYHx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1781028382;
 bh=ytbyKI+RdUvyVlcNYTn52rG1AH2yMD9Qe40oM2s5RvY=;
 b=Ex9LSYHxd6NOTB/n1T85/maqmG6fd03VFhFk9yyRaPRCRDvDdF9iw4pb6SpQxe42coCiZaih9
 KHqi5EuCEL3gbuVl1yxvlUucd+eP38JqQHDU8vkHBsgLAMnj6NVOw0f+ngN3n7UN2Z/5ncAIjFS
 /W5CwMMlS8hQhSdd8jQ1J2KLnAipSka9xOIW//YU0WKc5a0Z6T/IfKY4ur8WRO5LLYBDqpC4oJT
 ofm56VB5FlAIiBQfbiTpjXt/bJbc2yeZmpdMtXb8sBsDKLSGxbzqCUkP7oLbvBwkh3KmIBpILDC
 K/Y11R4L0AXmtQjXiosqPJRM1UzNuMAH0hdeUK0jQcIw==
X-Forward-Email-ID: 6a28561cb3badaab58d3c4fc
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.8.22
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <9e8f806d-72ec-4eb4-8967-3f82eb0e7dd4@kwiboo.se>
Date: Tue, 9 Jun 2026 20:06:17 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: usb: Add Rockchip RK3568 compatible for
 EHCI and OHCI
To: Diederik de Haas <diederik@cknow-tech.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260609154124.445182-1-jonas@kwiboo.se>
 <20260609154124.445182-2-jonas@kwiboo.se>
 <DJ4NVA328NUV.LSPMVBFE0PD8@cknow-tech.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <DJ4NVA328NUV.LSPMVBFE0PD8@cknow-tech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Diederik,

On 6/9/2026 6:32 PM, Diederik de Haas wrote:
> Hi Jonas,
> 
> On Tue Jun 9, 2026 at 5:41 PM CEST, Jonas Karlman wrote:
>> The Rockchip RK3568 EHCI/OHCI controller depends on clk_usbphy1_480m
>> being enabled, or the system may freeze when registers are accessed.
>>
>> Add Rockchip RK3568 EHCI and OHCI compatibles with a similar four-clock
>> constraint as RK3588.
>>
>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
>> ---
>> Existing DTs for RK3568 use the plain generic-ehci/ohci compatible,
>> next patch make use of these new compatibles and adds the missing
>> clk_usbphy1_480m clock references.
>> ---
>>  .../devicetree/bindings/usb/generic-ehci.yaml          | 10 ++++++++++
>>  .../devicetree/bindings/usb/generic-ohci.yaml          |  5 ++++-
>>  2 files changed, 14 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
>> index 55a5aa7d7a54..c49a1bbc8cfd 100644
>> --- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
>> +++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
>> @@ -52,6 +52,7 @@ properties:
>>                - ibm,476gtr-ehci
>>                - nxp,lpc1850-ehci
>>                - qca,ar7100-ehci
>> +              - rockchip,rk3568-ehci
>>                - rockchip,rk3588-ehci
>>                - snps,hsdk-v1.0-ehci
>>                - socionext,uniphier-ehci
>> @@ -186,6 +187,15 @@ allOf:
>>        required:
>>          - clocks
>>          - clock-names
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: rockchip,rk3568-ehci
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 4
> 
> I think that the constraint for rk3588 is this:
> - minItems: 1
> - maxItems: 4
> 
> Like ~ every other compatible; there's no 'branch' for rk3588-ehci.
> 
> That's different from what you add for rk3568. Is that deliberate?
> Because from the commit message I assumed they should be the same.

It was deliberate, the intention is to use min/maxItems: 4 for rk3568
for both EHCI and OHCI. I left out anything related to k3588 to keep
existing behavior and avoid any possible breakage, and why I used
'similar' and not 'same' in the commit message ;-)

Did a check and the rk3588 variant also uses 4 clocks so I will add same
constraint for the rk3588 variant and address Sashiko's concern in v2.

Regards,
Jonas

> 
>>  unevaluatedProperties: false
>>  
>> diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
>> index d42f448fa204..5f1b4d2bff89 100644
>> --- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
>> +++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
>> @@ -47,6 +47,7 @@ properties:
>>                - hpe,gxp-ohci
>>                - ibm,476gtr-ohci
>>                - ingenic,jz4740-ohci
>> +              - rockchip,rk3568-ohci
>>                - rockchip,rk3588-ohci
>>                - snps,hsdk-v1.0-ohci
>>            - const: generic-ohci
>> @@ -198,7 +199,9 @@ allOf:
>>        properties:
>>          compatible:
>>            contains:
>> -            const: rockchip,rk3588-ohci
>> +            enum:
>> +              - rockchip,rk3568-ohci
>> +              - rockchip,rk3588-ohci
> 
> Here they clearly do have the same constraint.
> 
> Cheers,
>   Diederik
> 
>>      then:
>>        properties:
>>          clocks:
> 

