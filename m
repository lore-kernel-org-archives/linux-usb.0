Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B26339371;
	Wed, 12 Aug 2026 11:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786533788; cv=none; b=Iyc97dpIFSRsiaqUl4tNpTgKZHQKLnGinmXFvXMBviyHDMPNymW6ZWoQ78azwVVd8TCxlViAkKHGK/e9uiQkGVEH7R7i4KrsUMt4jEZ4ieh40a3C0IDkVGuDO2WqSSTVJ9e8Bf7JUcPn5+FoEVvcGhysXn5nuAILGN+kR4Q4uUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786533788; c=relaxed/simple;
	bh=DuhQudckpF1o4s/TTbzcYOwZW1ajrCg1m9vjvKLI1vE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LW45VLEwQ2eBgCWmMjfDf24u3D/QNjobphIichmH6iU3pB2clp5u8psw/a3HccnMOXzkAopZSmN51fNnGa+q9QPCVrtRhWqw6ifC8pGo08izTcnYvY4CnsA6XJOYcRUNqpAKxCAmxirIA3Wl9t45xXvWI761gUpX4kdkrwtfkog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NzvnL8xo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NzvnL8xo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C66141F000E9;
	Wed, 12 Aug 2026 11:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786533786;
	bh=B3rsdyeixsiXlBfzAYLbSOg97l+AnhbT2pZJO9UDMwo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=NzvnL8xooJNVRE+ZFFFVJE/7qqc41UxIpGFCZTlO5ynXasGpyx/cATuSHBMYr57fO
	 UnZe96Ne6yStFWnJqNgH6hqvyQUu/a1ukuCk7rb9LNvyKIMcoHOQ1zNkvDUs4C5mWl
	 zoVT6IMBHc4kj2doFm0f5RYbeVOJKbkMeiNVYFYGBuzMfayzlWhL/pIGTUM91o/W0w
	 NKw+LX2IJ/MdCHiWl3fIEzgCBDIOXNCtkk8kOoMnISv4ThcM89zw1aYpe+iVwC+QhZ
	 EHOCvkVEW1qWgRfh9UUq/WTkOCYUvoonBgR5hotFIoeekyHOli2Ck+PxI5LVNyKXZX
	 rbj1/HIl89MEw==
Message-ID: <ff957fbb-b8ed-485d-adaa-18258ed693a6@kernel.org>
Date: Wed, 12 Aug 2026 13:22:55 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: phy: Document ST STM32MP25 USB2-FEMTO
 PHY
To: Marek Vasut <marex@nabladev.com>
Cc: linux-usb@vger.kernel.org, Pankaj Dev <pankaj.dev@st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Rahul Kumar <rahul.kumar05@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Rosen Penev <rosenp@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260812010157.1772849-1-marex@nabladev.com>
 <20260812010157.1772849-2-marex@nabladev.com>
 <20260812-silky-omniscient-dalmatian-b268cb@quoll>
 <ff691741-a110-44e8-90e7-ac54a96de1af@nabladev.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGPBBMBCgA5AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJp2mE8AAoJEBuTQ307QWKbeaIP
 /ihHTkTW4KsN/DQ945JJbyu5tI0J80Wue7QyyLPglyKfhgb5cLLNPpOC8cCIJsc7+W3i2P38
 s2c1cOH6CYGE7E9ur3Vfme8NW2S2I/Z8VC7bZnzyS23wT17LrsdS/qCpx4o8U+pt/xdXDKph
 EGRYrIEmMpUWvyYzyYKGIe25FtaayIIKpq8eZYyFcp2f/sG5IkOW5uZzHPMPdcm87jU7fyuQ
 rAU2vx9r+ulUfQ/q9Z2roC/ode3l7t2pN7BCBCsUDp6JCrUyZrtT1e7EbA0ZRP3aOBNk2P2E
 DQOgJGjGdO5Yx2Y9LFtltu6JbsBJHi1syGRX3AtQYOMc4Y1WGoeZJmMlvKj2ZqqXNkcWi2DS
 IQEWB0uW6CqFsBBIMGDa+6OzdaVO/uAVXWDWml02Men3CILdI1MbVjoh8ECqYUY7OQ+JJvNN
 vnliuq5WM3Ghd3jg/LZZrxXjdIginRHFQCjIJYLKpLZWm1/iDFedcfzqRNYmTtqscdCNHW41
 oT3Z7BmO9xwdjuwBS6nmS6JJwkbf5Ot2QR4pB/DRU7ZwjT1qHe+9r9gF32wXVQatHNGK/VVu
 sfwOnkdxCWkp/qb2gdQRmZh+SedStWshigH6sNfuHBloF/q+hjMRc8b2m326OZdrbSHwY1Sz
 vti8Hn7n8NjdHO9LKB7BIdjkA9DA5WsqOuVCzsFNBFVDXDQBEADNkrQYSREUL4D3Gws46JEo
 Z9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLueMNsWLJBv
 BaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6eiOMheesVS
 5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wAGldWsRxb
 f3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA6z6lBZn0
 WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9YegxWKvX
 XHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt91pFzBSO
 IpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gUBLHFTg2h
 YnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/JoFzZ4B0
 p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu4vXVFBYI
 GmpyNPYzRm0QPwARAQABwsF2BBgBCgAgAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtBYpsFAmna
 YUkACgkQG5NDfTtBYptX+BAApg32CkxwNucNEi8WfWA8oKkW0y8YDuY6ORMo9FWNGiT/OTy0
 vyJrLocrpn86zwfjVp+eCrssPYh8eqJfnWqmYv6ACQtHPYzPZQ3mSo8H97Z01oUxITzCxpXm
 ZkLgPIqtDPcC2E3dPM/fVxcyowM8XsaMA9wcsaUYrta8toOq2b9tKcjleKMfMrm0gQ9u7wUc
 QbLkwj6TCLOwucb07GXzLTNF9PZmaDUpKAZjMjmrW+le+SFvQbhamx0rxLWPR0NWntXpbCn+
 +ACch03p/JyTBVktxFsFyCt7pTPE1kEaeuXBTe/a2D9iQvRxRW19LvuO2e59/u1wYUiH/orz
 wbIC2S4dBsPAPihL3ztOU1yE86GPyQtSE0kU+/7snnLt4QGi6PChf3t5gnNjAzjUUovO8rgI
 c+5yN5heq5loYHgK6OQ9OlHzsPHO9e9MOQcKlFycs1pyijFGzDwdNUm/SchK8iWT2QApTx4A
 K9bCVaboTA2T77QYkRcRJYSsO1alGX0ome/hMLD1daXlkrNUp1HWa3K4iytLRXjCSIorWiGs
 n+q3krnpXu3TFkA8qtOFZMdnIiFuiq1yLT8hptsV5xh1TA2nsVvSYiaCr3q4s4BKjS/KrLDb
 qoxzw8ISjdUp4pA85vb6YLCmb39NgidD+7PmAr65lBNveIFynTgsja1rRQ4=
In-Reply-To: <ff691741-a110-44e8-90e7-ac54a96de1af@nabladev.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/08/2026 12:56, Marek Vasut wrote:
> On 8/12/26 12:15 PM, Krzysztof Kozlowski wrote:
>> On Wed, Aug 12, 2026 at 02:55:41AM +0200, Marek Vasut wrote:
>>> From: Pankaj Dev <pankaj.dev@st.com>
>>>
>>> Document USB2 PHY for STM32MP25 USB2 controllers, which includes the
>>> USB2.0 host-only controller and USB 2.0 part of the DWC3 controller.
>>> Two such PHYs in total are present in STM32MP25 SoC, they both are
>>> slightly different, therefore they use different compatible string
>>
>> What is slightly different? This should be either here, or better, in
>> "description" part.
> 
> They are both Synopsys FEMTO-PHY , but they are each attached to a 
> different controller (one to USB 2.0 host , the other to DWC3 DRD) , and 
> their control bits in the system controller register are different for 
> each variant.
> 
> I extended the description in V2.

Depending on the actual difference, this rather belongs to the phandle
to syscon, instead of separate compatible.

> 
>>> to discern them.
>>>
>>> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
>>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
>>> Signed-off-by: Marek Vasut <marex@nabladev.com>
>>> Signed-off-by: Pankaj Dev <pankaj.dev@st.com>
>>> Signed-off-by: Rahul Kumar <rahul.kumar05@st.com>
>>
>> Incomplete/incorrect DCO chain. Who sends it? Rahul?
> This is lifted from the ST downstream kernel fork, it's a combination of 
> a bunch of commits there and then cleaned up. Pankaj and Fabrice did 
> most of the downstream work, I did the clean up for upstreaming. I 
> collected the SoB lines from all the commits from ST downstream fork and 
> added mine, hence this list. How shall I address this correctly, with 
> some Co-developed-by tag ? Who gets which tag ?

Everything explained in submitting patches. The SoBs represent the
chronological lifecyle of the patch. Person sending the patch is
obviously the last one touching. How Rahul could touch the code AFTER
you sent it?


Best regards,
Krzysztof
