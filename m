Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F6A42E8F8
	for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 14:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785508958; cv=none; b=jRSC693zHbTh7B2MgVZkJ7sBZ5jWjWGhB0fysmewAyzNoETrv3A/zbGDHnYC9IsGm/VYueewyaOV18AKHAakJJi00A2T9d5tJJqJVPA0ln6mf67f446ghAUn/PVF1dY5t44cLxEUjM7Y2n+p1jGfbPHRO9Y4L3uHxRDKcA0IDSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785508958; c=relaxed/simple;
	bh=tBo1pOIGLQzGzdk2QTAoCK07FNlt308/uZWd59j360w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YBMLcfqibXiWSvZT3HMeN9dBeJUFiBkEDbAp1UAj+SLioIQG3JIjO7GAJXy7EMwxANPB/Qojlfx5KS6qcD4SEmokMYO3Pjem1svOfeKBM1/PCrC7vlu3Ibtnrzyc/coPF59CYJFU/JVL8oypnaA4smEjWtjAEmjFUk8AuGT5rec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o/rNEoJ8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iMAXKoYy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o/rNEoJ8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iMAXKoYy"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VCHjvX058232
	for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 14:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hV/RxAH1jzvT9xYdfJOYdrkiDJC+wzPI1b5Q4RRYKRg=; b=o/rNEoJ8Oye8yOuF
	zL6GwiazrXRPiI+uF8nuWoBzc0ZlBjPX+m3pwkU8aGZ46/XUJ/H4BikXVmcxx/8a
	jEJtTz8kgaAQeS52Zv/l9JSSCEbbIvhW0j9P8T9yJyvAMyqO/Z2DKI2wcD58YOx3
	CDUxaim7tmttEvgQKpkJ+bCJ78WZCo0NGeAdCJqqzPktw8/0P3PkedyWGrav8FLr
	0+K8G/YaIQWUya9VPJ1w7TXufpter81WjdDhCP5qMIpCgmDpbwL7IFglq6wc5Xwb
	KQSnDZbRiPz4YaR4NoBTXBLvXTCd8pbwGyHz/HmAOk9lp75Jk/3OuxBrdcGz0S1l
	1WSbdQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fruk8rmy8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 14:42:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93102454272so18872685a.1
        for <linux-usb@vger.kernel.org>; Fri, 31 Jul 2026 07:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785508955; x=1786113755; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hV/RxAH1jzvT9xYdfJOYdrkiDJC+wzPI1b5Q4RRYKRg=;
        b=iMAXKoYyNT3xLjRpA0//GrIksqRCjKwsKFqDNO4T7Y/pPEunAS4sM6uruyGG+4py0X
         ZMMgbNbMFa5aCfE1EFazCW7/fmfDoCn14PaXQ0z6hFvDXx0kc/jV8WbrmtSlUOxaMVYf
         51iiPOoi/VD5zE6aaTDLpCgnBtqDKlEvGubkoGGOKgYn2jgdl3bLay78jECbafsnMDv3
         xGQkGGb8VBu+tP61qhkv9sruEsQDtdl5sOdTtlk3R3QEXtzYZB8i4b9K8+L5F3sG1rpS
         +NL4/Dm5hX2WJi2jtliLufLlCnhOKgnEgmrFQ8ETaccCKiilF2S70fxbSoZnFP854U4M
         SwrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785508955; x=1786113755;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hV/RxAH1jzvT9xYdfJOYdrkiDJC+wzPI1b5Q4RRYKRg=;
        b=fY9XowdUo+MMGKrGNWD2mbwzGDgu9MWDeEcNnIq+nsl3oNEGHAcnOs4dGpE/6Jq/nC
         +4Zaz4XSum0M4SlJLdC2WybvS/qYctIKc+iBLgODTlg/bBJgedc4AKrfyBVPQtIDZ6f6
         TzyEiIzvpBFS3in2hSKk/lYdWjI33hnPaLuMiniIZwk8vp4RcSOx6rpUjClzGNPsfgNi
         nMHT3eWJ6B05nBHCn/v6z6XVdW8j0NqdEDOTmol1rcezzKSpvANNk5J8z0o0E5or+kv9
         oxNy+yBkTgqotIjcQY3e4CgPRWs/GAl0r6pBEQzPBE6Mgwxq/DCjxRfYG1JpbGVpqv9m
         ne6A==
X-Forwarded-Encrypted: i=1; AHgh+RoRuh+bJfDZJ0HE+4HJasn7GgHguJoxhv37qO7v1ViuUVo5W5thjszLEEyX3YEo8LSEJd12A32zzEQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YziGCj04VeOcbAxuC81iJgahiBrOq6tJC0LBY3nfEj6RGiTzUUB
	nCONE9SrA1NsTubPDYJZsRSXd+DBC00dCCkAK3Q0wXHi3mXEGH8ThtbJszstPG+rNaJW268Fh+W
	hu5lCkgs71T09Wc0OuGF2jjD37sDBk6slLqgLokgNUHyEZcpi9F5AWuMOZrhNzAQ=
X-Gm-Gg: AR+sD13FU3j1U4MTtwH/55Ix8W2tPEDiAeFDMT5yoCIXwSZX1kqlmG/sDl6g9FjfmWm
	YTKZFLbqqdmBeKdZEyeu+OG8ljsOlNZ67/EnW9lkmrDO76B4CqjJzKtbBsqV3HU3o2tJ128Z22k
	i/M35iIi3QOqpSN3DswqG5ecrOyR170yJPzrUKjwGfuTxbAVstN7Ln4mJ0O4kdWNLwv6FxR0JWQ
	P7ncCWXx0T1brfH6u/WgUcg3yvnw2mn2Xt2v1LW8L3RmtSYZohWuYo6VR4XEStha8Q9s0QaDoo6
	BUvIw+2FiMfSqACxaQdZIuQdRF0G5h0CkfN7t3wPuHILHlO289Ic2nTWIqurbWze7nA73bs6Ufx
	AaAUfXNRL6jn/Hlk7S2yAcW0O
X-Received: by 2002:a05:620a:17a1:b0:930:f930:a09f with SMTP id af79cd13be357-934a06e88c5mr34875085a.1.1785508955185;
        Fri, 31 Jul 2026 07:42:35 -0700 (PDT)
X-Received: by 2002:a05:620a:17a1:b0:930:f930:a09f with SMTP id af79cd13be357-934a06e88c5mr34869985a.1.1785508954780;
        Fri, 31 Jul 2026 07:42:34 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f812e3a7dsm1541071fa.32.2026.07.31.07.42.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 07:42:33 -0700 (PDT)
Message-ID: <c6526ba0-be08-46c6-a501-1b161939657c@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 16:42:29 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/16] usb: hub: Associate port@ fwnode with USB port
 device
To: Chen-Yu Tsai <wenst@chromium.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260721065413.2306137-1-wenst@chromium.org>
 <20260721065413.2306137-7-wenst@chromium.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260721065413.2306137-7-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=W8sIkxWk c=1 sm=1 tr=0 ts=6a6cb45b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=cm27Pg_UAAAA:8 a=7ZmCE17i0x7kTLN8kT8A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDExMiBTYWx0ZWRfX1R6pK/GfyScz
 esety0drchNeEgAxWQHSS1/niTEQ9VIzXflzUHvCsUdt9mLXpdnjHKC8G5k4GT5qJOPtI8bX4+G
 wqmTLgv/mfx97CqS6LOvyG7FISnetDw=
X-Proofpoint-ORIG-GUID: fA8X-DAbU57iPEeVIJ6yl4JUlsdjYUb-
X-Proofpoint-GUID: fA8X-DAbU57iPEeVIJ6yl4JUlsdjYUb-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDExMiBTYWx0ZWRfXwiei/60K7v3r
 YOH+GadN8QFTC2Csgl1kNIhOrVjGVIdPZdRTJ56krQwthGAF3Fl1MEeH7TZ8Ya05G+SmshEDq3L
 SL3lTWzmUzBkaMAkNbA8EqLvYSmh36oSflO84YGMKPWRWjcyZWJqqsRFiyuUlGfGorm6cBTt2vL
 5w2NoXRuFKyNng6A8M5tW5fPV1scddjny7Wu5bAYMcIiYEoEG/Mm9gn1dP/3xnaiQZ4kpW4GqYt
 9NQunRjA+Rf8aIWRetO95gYrVuvYqP5qfGnP7aBfnlNzlAFGd6VlgsKW+iD61zW9eKjQdOf5cYe
 ZesdIrgd1McdpQcRfLzdnAIJsZQKRzgmCTE5zXA4L42zqmmjTAVDME4yVmAcRwx6WfmHTCl7g3Y
 oLv3m6F1Uy9H5Efj6Srx1iXy0HH6le/HFd2uRHKSLxEdq0m5+rVJcxD9IYyPyiAN4y9FAsqXNlc
 S9MexEPn8o0310Eu0hw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310112

On 7/21/26 8:54 AM, Chen-Yu Tsai wrote:
> When a USB hub port is connected to a connector in a firmware node
> graph, the port itself has a node in the graph.
> 
> Associate the port's firmware node with the USB port's device,
> usb_port::dev. This is used in later changes for the M.2 slot power
> sequencing provider to match against the requesting port.
> 
> To avoid potential conflicts with ACPI firmware nodes and then causing
> power management issues, only assign the firmware node if the hub's
> firmware node is not an ACPI firmware node.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

[...]

> +	/*
> +	 * ACPI FW nodes are associated later when device_register() happens.
> +	 * Skip assigning one here to avoid potential conflicts.
> +	 */
> +	if (!is_acpi_node(fwnode)) {
> +		struct fwnode_handle *port;
> +
> +		/*
> +		 * fwnode_graph_get_port_by_id() returns either a valid fwnode handle
> +		 * or NULL. Passing NULL to device_set_node() clears any associated
> +		 * fwnode. It is effectively a no-op here, since no fwnode has been
> +		 * assigned to the newly created device yet.
> +		 */
> +		port = fwnode_graph_get_port_by_id(fwnode, port1, FWNODE_GRAPH_DEVICE_DISABLED);

This works if the node at the other end of the graph is a
USB hub, e.g. from qcom/lemans-evk.dts:

usb_hub_3_x: hub@2 {
	compatible = "usb5e3,625";
	reg = <2>;

	peer-hub = <&usb_hub_2_x>;

	ports {
		#address-cells = <1>;
		#size-cells = <0>;

		port@1 {
			reg = <1>;

			usb_hub_3_1: endpoint {
				remote-endpoint = <&hd3ss3220_1_out_ep>;
			};
		};

		port@4 {
			reg = <4>;

			usb_hub_3_4: endpoint {
			};
		};
	};
};

But something I faced when I was poking at USB4 was that dt-bindings
currently assume every controller is effectively single-port and the
of_graph ports under it represent HS/SS lanes, i.e. the entire
"ports" subnode represents a single USB port

I think the solution here would be to do ports {} under the controller
and have every one of them have 2 endpoints (for HS and SS
respectively) - then, each DT-port would correspond to a USB port
(sorta like in the hub case, minus the hubs are split for HS/SS so
they have just a single endpoint under each port)

But that comes with a big breakage, as always..

Konrad
