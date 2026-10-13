Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DF2511E73
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 13:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791898810; cv=none; b=MJt7WAgLgIa62EMlJPcf6c1jHK5mBnb+8Ie4FoHId0w3rINIryC7s3HUF9oAdNBEAl384H+7XxyJwtdoDJTjBJGmlM6K4hUyTJgejusJocwl/G+0Q+5HBcB4O4eAO5toeXtxvEdHsJkh9hI4qZjWdj+2V/QBSdgO61yhkk2kMLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791898810; c=relaxed/simple;
	bh=5n1C5kdCuZiIv1NyJcV5joLpU2VBYIV+zY32x332UOU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sWnM3pJI48XfeG2ilogohgb30QJx7k73LDVJp9woTIVJ03fwUKwbzoHHXviN1CJPWRJO2dmQLlhUbaJSCx0nNHnM/8+AJsTgjqL0YcsFoUP03PwvShrPPa31/WOuYACJSrNwAOxYpgOT4qLcgLV6J3DsjN0L3sKjP9FMgKSjBJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UH3L5tMk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ajih7Zjg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UH3L5tMk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ajih7Zjg"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D9c48C3476152
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 13:40:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	69d40e+kaSYlxvWwy4pVpeKZomSq3iB9ZKfIxKfNAbY=; b=UH3L5tMkItOQlQNK
	1c1i3vhcfEs6JQ/w/TPdLOauCQFF51bYMKjt89FepPEHwq0VctK/OYHPN20/xVlP
	ko7TN6kZ8+LESyfd6aCSi8JSB1j8xAALBJtYzno8koFYS7GNsSdFxLrYm97++L8r
	nGZ7U9k17/4UwhhPbQLS+jxYwHr+zQpxfaa7HUfueYYXMEIFk7YDRuuqUF0Hj/J8
	f6DQ6i0XKmIfmdP9sL9oVQhkxmtn3TK9LTHFBPKi6Bf5UJeGm9bvECUTDQGHkdz0
	ZytmSohAOwCtAKwyhGcag7Q+sIckJLyixGPRXIseeHOjRtZ7MEUDZuyLuZBSXo0T
	DBH5BQ==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9d7jaaev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 13:40:08 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8ab43f7f5faso38915777b3.2
        for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2026 06:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791898807; x=1792503607; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=69d40e+kaSYlxvWwy4pVpeKZomSq3iB9ZKfIxKfNAbY=;
        b=Ajih7Zjgbn6R4eBN5qaBeNArzgYXZ1INXBQHea2XMZ7K6j3Ne2wzVc3w1qDGWJHBp7
         OvNOEKe6xYk4s6v8DDSysSVvjADoiVVVILnrqUsQIJqwiDJ3SyRjAaN3Vy9mHcnnAjcr
         JYOYgTpTp/1VUsbwKYZFo9JDZaRxH7lSkVsmSepUQOWgnQFsFQ18wBiLeSFsyFtpDwAr
         ZnQNh9wqHY6CPNP61kKorBxAx1ik9vin1211iewzPFKFRSeKSGtr9umszuZ5az7slGkd
         X+2/w7nRjLyTc9NwrC0YEBv/l2ayUy+Jv4ktyXMBDi41BAZxb7W1XxJJNvDMJDf0I3cY
         vSpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791898807; x=1792503607;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=69d40e+kaSYlxvWwy4pVpeKZomSq3iB9ZKfIxKfNAbY=;
        b=WD5H9qOqajWL7+FwO8UfNXdwZqDRp9Dhs8YhKLR4v4fjm/uFQ5riwOaB7DdUTQBIuI
         3mMV/pyDLhTRfPPjDBp8BEYiOLx76acJs2LeDZBO9AIL7ZblGpryvxMxFHgW594x0n7M
         H4V4Nrtfb/SrbUmfLOadb7TLNHOkuR0UxTNbpLCCCVSRzElDCcuIheW5EggHodrMV9x4
         iqapG7HT+BxpZG63V0QEQl3E/JNT/zScu4VfoIjbpdndOBXjLn+uZuT1gio7/UQb6XGd
         6ZVi5D7Hi0I8Gyvmd/NBKlnG12rswVPIl3DFDF0dtg28aHm8TScMwtJyqtUAOk+zL972
         8jKw==
X-Forwarded-Encrypted: i=1; AKwUvBylkUM4USQwIbrREwcSr9ZQYu26YcEwPzmZbhqDscvx11b676hzvuyZjDvQZxchL406mA2lgO6EGb0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKC0Z2/Znm2b1LM7aX//Ox6HgAKzp3oYdS58uJy3qAKTxpN5wSg
	f5IlZQqhq3cJicEsnFtV6p4lfMNKpgVSqFmMBssVSFHL/Cvlh/DCOUhSJ1mOfmIPMybr/RVS9T7
	6rtnm7i4jj94BOxTV2KwCiO/ySDpGPCJatKCkaywrpdUvmOpnVkBYVi2upLXaVrM=
X-Gm-Gg: AYBFou0jbrgdEMktfM4cW4Pkr3bAK4v+0Cfe/0JEyuvgXg+MlSJPqgH3iUlVWZgqp/k
	AgxMZ0TIJHeJuZN3uRrMyuQ9eoDlBpwYO4fGL7IlBgCVO7lVCjV0/7vvXsgDyaMexI9goUQzhx2
	CubTW4+ZbRfV5xT3dReyn+M10ZlF6Hl8XKHrbRTG+UNOPyDWHZiPR+8h2IcJq5iPUPKzCVRb7nz
	I/BFeu29tey0cZrz7f/WShS0z8pA5wjr/UZRYoxve+qXggmhoKbtQcVBLMtm6LBEF3UDGMKxMcl
	Kq3cnvWz0suYrKCDwVIZS/GVDCQz8L1VfpIVFjR5lXOToU7Dij3isjUytItW805Ym/0Brb57dj+
	RBItW5Df+pngDa6SVbst0auqHD7zdFw==
X-Received: by 2002:a05:690c:e3ca:b0:8b0:a54d:aeac with SMTP id 00721157ae682-8b0a54ec872mr15865957b3.14.1791898807224;
        Tue, 13 Oct 2026 06:40:07 -0700 (PDT)
X-Received: by 2002:a05:690c:e3ca:b0:8b0:a54d:aeac with SMTP id 00721157ae682-8b0a54ec872mr15865827b3.14.1791898806727;
        Tue, 13 Oct 2026 06:40:06 -0700 (PDT)
Received: from [10.217.218.70] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07f1c8612sm46658947b3.15.2026.10.13.06.39.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 06:39:39 -0700 (PDT)
Message-ID: <19dca84c-68b0-48de-addc-399c406fb152@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 19:09:09 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] dt-bindings: usb: Add qcom,sa8255p-dwc3 for
 firmware-managed resources
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        mathias.nyman@intel.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, p.zabel@pengutronix.de,
        wesley.cheng@oss.qualcomm.com, sriram.dash@oss.qualcomm.com,
        jack.pham@oss.qualcomm.com, krishna.kurapati@oss.qualcomm.com,
        shazad.hussain@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261010053246.2991984-1-faisal.hassan@oss.qualcomm.com>
 <20261010053246.2991984-4-faisal.hassan@oss.qualcomm.com>
 <20261013-light-significant-markhor-c30eea@quoll>
Content-Language: en-US
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
In-Reply-To: <20261013-light-significant-markhor-c30eea@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: EH_03JbsW7ymPtgYxfzp9ljTTAff5Whn
X-Proofpoint-ORIG-GUID: EH_03JbsW7ymPtgYxfzp9ljTTAff5Whn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1NCBTYWx0ZWRfX2mObFw8rTSe6
 G3NDgfS/+5NtyA/mGqT2sRuZza9LHYEayQM7QJAkPbErGULaPTj9C+KuPmb+dNvlM77yEs8MyxI
 muc8isydsiClwYLZJ3VnfXlIhQy2IAY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1NCBTYWx0ZWRfXz28wAztYHtU0
 HFgN78LOF7xkC1Ds8Iz+t7C+fWUsQRSz3SCNej3CHSD6hDo2MSfWJivgKkAI0Xe53HmZqB0T8NE
 wppN7Liv+BkyCQrhs7nH9ppBfiKDnbGcJUE9iuPG3D4lgZxhvuLLJHkFJ4JOf7yrzpolWm8ojxF
 3QU1A/FJSb56vF+xjnJfiUT7zUv3xaG8ftKwVZu33RPeWS2xsWoxyCqQdAvRGbNeOQuvtiSIfgu
 ydpPLhsGn6NIsUWNTvstoTAKQe7gArtItbRrnjs9wetF9bQQL6biLyGoXaKW6wUC4wWgrwKjruv
 vxNpXkJiVD01FrtTOEdoiYAalTGq2BAhEIVNZc2jpF8Sp7z6V4LS5WkYMc1wqqRiqiDMjhJosTK
 UzZ9gw0shcVn08tU19lYWVmnICQw+9MlM6DcrN3L//ZuH7IXqxRgtwCj9wMG9yMycylwJK0USLO
 hiMIxPBrBjIi6I1KDzw==
X-Authority-Analysis: v=2.4 cv=PMGaavqC c=1 sm=1 tr=0 ts=6ace34b8 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=zkeY3IreNFxg1TzoVDwA:9 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130054

On 13-10-2026 12:50 pm, Krzysztof Kozlowski wrote:
> On Sat, Oct 10, 2026 at 11:02:42AM +0530, Faisal Hassan wrote:
>> On Qualcomm automotive SoC sa8255p, platform resources like clocks,
>> interconnects, resets, regulators and GDSC are abstracted and managed
>> collectively by firmware.
>>
>> Add a new binding file for firmware-managed USB controllers where
>> access to these resources is exposed as two power domains:
>> - Power domain: Controls power supply (GDSC) to the USB controller
>> - Bus domain: Controls clocks and interconnects for data transfer
>>
>> The binding makes power-domains and power-domain-names properties mandatory
>> for firmware-managed platforms, while excluding the clocks property since
>> clocks are managed through the power domains.
>>
>> Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
>> Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
>> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
>> ---
>>   .../bindings/usb/qcom,sa8255p-dwc3.yaml       | 119 ++++++++++++++++++
>>   1 file changed, 119 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml
>> new file mode 100644
>> index 000000000000..87f426fdbd70
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml
>> @@ -0,0 +1,119 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/usb/qcom,sa8255p-dwc3.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm SA8255P USB3 Controller with Firmware-Managed Resources
>> +
>> +maintainers:
>> +  - Wesley Cheng <wesley.cheng@oss.qualcomm.com>
>> +  - Faisal Hassan <faisal.hassan@oss.qualcomm.com>
>> +
>> +description:
>> +  USB controller on Qualcomm SA8255P automotive SoC where platform resources
>> +  such as clocks, interconnects, resets, regulators and the GDSC are
>> +  abstracted and managed collectively by firmware through SCMI (System
>> +  Control and Management Interface).
>> +
>> +  Access to these firmware-managed resources is exposed as two power
>> +  domains, one gating the power supply (GDSC) to the controller, and one
>> +  gating the clocks and interconnects used for data transfer.
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,sa8255p-dwc3
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    minItems: 5
>> +    maxItems: 6
>> +
>> +  interrupt-names:
>> +    minItems: 5
>> +    items:
>> +      - const: dwc_usb3
>> +      - const: pwr_event
>> +      - const: hs_phy_irq
>> +      - const: dp_hs_phy_irq
>> +      - const: dm_hs_phy_irq
>> +      - const: ss_phy_irq
> 
> That's still unexpectedly flexible.
> 

Ok, I'll drop minItems so the list is fixed at 6 entries:

   interrupts:
     maxItems: 6

   interrupt-names:
     items:
       - const: dwc_usb3
       - const: pwr_event
       - const: hs_phy_irq
       - const: dp_hs_phy_irq
       - const: dm_hs_phy_irq
       - const: ss_phy_irq

>> +
>> +  power-domains:
>> +    minItems: 2
> 
> Drop
> 
>> +    maxItems: 2
>> +
>> +  power-domain-names:
>> +    items:
>> +      - const: power
>> +      - const: bus
> 
> I don't see how did this improve. I asked to use existing bindings as
> reference, so why aren't these power and perf? You wrote that bus
> controls clocks and interconnect, so is this something different than
> perf domain is doing for sa8255?
> 

The sa8255 "perf" domains (e.g. GENI) are SCMI performance-protocol
domains with OPP levels. USB "bus" is a plain SCMI power domain with no
levels, only on/off, so "perf" would be misleading. I'd like to keep
"bus", and will drop the redundant minItems.

>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  iommus:
>> +    maxItems: 1
>> +
>> +  phys:
>> +    minItems: 1
>> +    maxItems: 2
> 
> phys should be afixed, constrained.
> 
>> +
>> +  phy-names:
>> +    minItems: 1
>> +    maxItems: 2
> 
> This as well.
> 

Sure, will modify as below.

   phys:
     maxItems: 2

   phy-names:
     items:
       - const: usb2-phy
       - const: usb3-phy

>> +
>> +  dma-coherent: true
>> +
>> +  # Firmware-managed platforms do not use direct clock/interconnect control
>> +  clocks: false
>> +  clock-names: false
>> +  interconnects: false
>> +  interconnect-names: false
> 
> Drop all four above. Not sure why do you need them.
> 

Sure.

>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - interrupt-names
>> +  - power-domains
>> +  - power-domain-names
>> +  - resets
> 
> I guess phys and phy-names as well.
> 

Sure, will add both.

>> +
>> +allOf:
>> +  - $ref: snps,dwc3-common.yaml#
> 
> Best regards,
> Krzysztof

Let me know if these changes look OK, and I'll send v4 with them.

Thanks,
Faisal
